#include <stdio.h>
#include <windows.h>
#include <iostream>
#pragma warning(disable : 4996)

#define MODE_TEST_HELLO	0x01
#define MODE_TEST_ECHO	0x02
#define MODE_STORE_RAM	0x03
#define MODE_LOAD_RAM	0x04
#define MODE_STORE_TEST	0x05
#define MODE_LOAD_TEST	0x06


char data_read[100];

void* open_port(const char* port_name);
void close_port(HANDLE comport_handle);
void test_hello(void* comport_handle);
void test_echo(void* comport_handle);
void store_file(void* comport_handle, const char* file_name, uint32_t base_addr, uint32_t words_to_send);
void verify_file(void* comport_handle, const char* file_name, uint32_t base_addr, uint32_t words_to_recv);
void store_testip(void* comport_handle, uint32_t offset, uint32_t data);
void load_testip(void* comport_handle, uint32_t offset);

/*
int main() {
	int done = 0;
	HANDLE comport_handle = open_port("COM5");
	

	//send file to be stored in DRAM
	//file stored at memory location 0x0000_0000
	fprintf(stderr, "sending file to FPGA\n");
	store_file(comport_handle, "file_to_send.txt", 0x00000000, 4096);
	fprintf(stderr, "\n");

	//verify that file is stored correctly at DRAM location 
	verify_file(comport_handle, "file_to_send.txt", 0x00000000, 4096);

	//set give dma_wrapper neccessary information
	fprintf(stderr, "sending dma_wrapper information\n\n");
	
	fprintf(stderr, "checking RDATA\n");
	load_testip(comport_handle, 0x00);
	fprintf(stderr, "\n");

	
	fprintf(stderr, "sending read address\n");
	store_testip(comport_handle, 0x10, 0x00000000);//set read address to 0x0000000
	fprintf(stderr, "checking read address\n");
	load_testip(comport_handle, 0x10);
	fprintf(stderr, "\n");
	
	fprintf(stderr, "checking RDATA\n");
	load_testip(comport_handle, 0x00);
	fprintf(stderr, "\n");

	fprintf(stderr, "sending width = 0x080, height = 0x080\n");
	store_testip(comport_handle, 0x14, 0x03080080);//set width = 0x080, height = 0x080
	fprintf(stderr, "checking width, height\n");
	load_testip(comport_handle, 0x14);
	fprintf(stderr, "\n");
	
	
	fprintf(stderr, "sending framesize = 0xFF\n");
	store_testip(comport_handle, 0x1c, 0x00004000);//set framesize to 0x4000
	fprintf(stderr, "checking framesize\n");
	load_testip(comport_handle, 0x1c);
	fprintf(stderr, "\n");

	
	fprintf(stderr, "sending write_address\n");
	store_testip(comport_handle, 0x18, 0x005eec00);//set write address
	fprintf(stderr, "checking write address\n");
	load_testip(comport_handle, 0x18);
	fprintf(stderr, "\n");

	//fprintf(stderr, "sending ap_start\n");
	//store_testip(comport_handle, 0x00, 0x00000001);//ap_start 0->1
	//Sleep(1);
	//fprintf(stderr, "checking if done");
	//load_testip(comport_handle, 0x00);
	//fprintf(stderr, "\n");
	


	//verify that the file is written to write_address
	//fprintf(stderr, "verifying that file written correctly to write_address\n");
	//verify_file(comport_handle, "file_to_send.txt", write_address, 4096);

	close_port(comport_handle);
	return 0;
}
*/

//for simple testing

int main(){
	HANDLE comport_handle = open_port("COM5");
	test_hello(comport_handle);

	test_echo(comport_handle);

	//fprintf(stderr, "sending file to FPGA\n");
	//store_file(comport_handle, "file_to_send.txt", 0x00000000, 4096);
	//fprintf(stderr, "\n");
	//fprintf(stderr, "checking width, height\n");
	//load_testip(comport_handle, 0x14);
	//fprintf(stderr, "\n");

	fprintf(stderr, "sending width = 0x080, height = 0x080\n");
	store_testip(comport_handle, 0x14, 0x03080080);//set width = 0x080, height = 0x080
	fprintf(stderr, "checking width, height\n");
	load_testip(comport_handle, 0x14);
	fprintf(stderr, "\n");
	
	close_port(comport_handle);
	return 0;
}

void* open_port(const char* port_name) {
	
	HANDLE comport_handle = CreateFileA(port_name, GENERIC_READ | GENERIC_WRITE, 0, 0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);

	if (comport_handle == INVALID_HANDLE_VALUE) {
		fprintf(stderr, "[FAILED] CreateFileA\n");
	}

	DCB serial_params = { 0 };
	serial_params.DCBlength = sizeof(serial_params);

	if (GetCommState(comport_handle, &serial_params) == FALSE) {
		fprintf(stderr, "[FAILED] GetCommState\n");
	}
	

	serial_params.BaudRate = CBR_9600;
	serial_params.ByteSize = 8;
	serial_params.StopBits = ONESTOPBIT;
	serial_params.Parity = NOPARITY;

	if (SetCommState(comport_handle, &serial_params) == FALSE) {
		fprintf(stderr, "[FAILED] SetCommState\n");
	}

	//set timeouts
	COMMTIMEOUTS timeout = { 0 };
	SetCommTimeouts(comport_handle, &timeout);

	return comport_handle;
}

void close_port(HANDLE comport_handle) {
	CloseHandle(comport_handle);
	return;
}

void test_hello(void* comport_handle) {
	DWORD dw_byte_written = 0;
	DWORD dw_byte_read = 0;
	uint8_t mode_signal = MODE_TEST_HELLO;

	//MODE signalling
	if (WriteFile(comport_handle, &mode_signal, 1, &dw_byte_written, NULL)) {
		fprintf(stderr, "[  OK  ] MODE 0x%02X\n", mode_signal);
	}
	else {
		fprintf(stderr, "[FAILED] MODE 0x%02X\n", mode_signal);
		return;
	}

	if (ReadFile(comport_handle, data_read, 16, &dw_byte_read, NULL)) {
		fprintf(stderr, "[  OK  ] Response: ");
		for (int i = 0; i < 16; ++i) {
			fprintf(stderr, "%c", data_read[i]);
		}
		fprintf(stderr, "\n");
	}
	else {
		fprintf(stderr, "[FAILED] Response\n");
		return;
	}

}

void test_echo(void* comport_handle) {
	DWORD dw_byte_written = 0;
	DWORD dw_byte_read = 0;
	uint8_t mode_signal = MODE_TEST_ECHO;

	char send_string[16] = "Test echo abcde";

	//MODE signalling
	if (WriteFile(comport_handle, &mode_signal, 1, &dw_byte_written, NULL)) {
		fprintf(stderr, "[  OK  ] MODE 0x%02X\n", mode_signal);
	}
	else {
		fprintf(stderr, "[FAILED] MODE 0x%02X\n", mode_signal);
		return;
	}

	if (WriteFile(comport_handle, send_string, 16, &dw_byte_written, NULL)) {
		fprintf(stderr, "[  OK  ] SEND:");
		for (int i = 0; i < 16; i++) {
			fprintf(stderr, "%c", send_string[i]);
		}
		fprintf(stderr, "\n");
	}
	else {
		fprintf(stderr, "[FAILED] SEND");
		return;
	}

	if (ReadFile(comport_handle, data_read, 16, &dw_byte_read, NULL)) {
		fprintf(stderr, "[  OK  ] Response: ");
		for (int i = 0; i < 16; ++i) {
			fprintf(stderr, "%c", data_read[i]);
		}
		fprintf(stderr, "\n");
	}
	else {
		fprintf(stderr, "[FAILED] Response\n");
		return;
	}

}

void store_file(void* comport_handle, const char* file_name, uint32_t base_addr, uint32_t words_to_send) {
	//file name -> name of file to send. assuming txt file
	//words to send -> number of words in file
	//open file
	FILE* f_send = fopen(file_name, "r");

	//allocate buffer and read file to buffer
	uint32_t* buffer = (uint32_t*)calloc(words_to_send, sizeof(uint32_t));

	if (f_send != NULL) {
		for (int i = 0; i < words_to_send; ++i) fscanf(f_send, "%X", &buffer[i]);
	}

	fclose(f_send);

	//send 1-byte command to board
	DWORD dw_byte_written = 0;
	DWORD dw_byte_read = 0;
	uint8_t mode_signal = MODE_STORE_RAM;

	if (WriteFile(comport_handle, &mode_signal, 1, &dw_byte_written, NULL)) {
		fprintf(stderr, "[  OK  ] MODE 0x%02X\n", mode_signal);
	}
	else {
		fprintf(stderr, "[FAILED] MODE 0x%02X\n", mode_signal);
		return;
	}

	//check if FPGA has received mode signal
	if (ReadFile(comport_handle, data_read, 16, &dw_byte_read, NULL)) {	//expected response is "Waiting CMD"
		fprintf(stderr, "[  OK  ] Response: ");
		for (int i = 0; i < 16; ++i) {
			fprintf(stderr, "%c", data_read[i]);
		}
		fprintf(stderr, "\n");
	}
	else {
		fprintf(stderr, "[FAILED] Response\n");
		return;
	}


	//send file metadata(DRAM base addr / file size)
	uint32_t encoded_data[2];
	encoded_data[0] = base_addr;
	encoded_data[1] = words_to_send;

	if (WriteFile(comport_handle, &encoded_data, 8, &dw_byte_written, NULL)) {
		fprintf(stderr, "[  OK  ] SEND CMD\n");
	}
	else {
		fprintf(stderr, "[FAILED] SEND CMD\n");
		return;
	}

	if (ReadFile(comport_handle, &data_read, 16, &dw_byte_read, NULL)) { //expected response is "CMD receive"
		fprintf(stderr, "[  OK  ] Response: ");
		for (int i = 0; i < 16; i++) {
			fprintf(stderr, "%c", data_read[i]);
		}
		fprintf(stderr, "\n");
	}
	else {
		fprintf(stderr, "[FAILED] Resonse:\n");
		return;
	}


	//send file
	if (WriteFile(comport_handle, buffer, words_to_send * sizeof(uint32_t), &dw_byte_written, NULL)) {
		fprintf(stderr, "[  OK  ] SEND %s\n", file_name);
	}
	else {
		fprintf(stderr, "[FAILED] SEND %s\n", file_name);
		return;
	}

	
	//get response
	if (ReadFile(comport_handle, &data_read, 16, &dw_byte_read, NULL)) { //expected response is "Store complete"
		fprintf(stderr, "[  OK  ] Response: ");
		for (int i = 0; i < 16; i++) {
			fprintf(stderr, "%c", data_read[i]);
		}
		fprintf(stderr, "\n");
	}
	else {
		fprintf(stderr, "[FAILED] Resonse:\n");
		return;
	}

	free(buffer);

}

void verify_file(void* comport_handle, const char* file_name, uint32_t base_addr, uint32_t words_to_recv) {
	//load file from FPGA DRAM and verify
	//file name -> name of file to load. assuming txt file
	//words to recv -> number of words in file
	
	//open file
	FILE* f_send = fopen(file_name, "r");

	//allocate buffer and read file to buffer
	uint32_t* buffer = (uint32_t*)calloc(words_to_recv, sizeof(uint32_t));

	if (f_send != NULL) {
		for (int i = 0; i < words_to_recv; ++i) fscanf(f_send, "%X", &buffer[i]);
	}

	fclose(f_send);

	//send 1-byte command to board
	DWORD dw_byte_written = 0;
	DWORD dw_byte_read = 0;
	uint8_t mode_signal = MODE_LOAD_RAM;

	if (WriteFile(comport_handle, &mode_signal, 1, &dw_byte_written, NULL)) {
		fprintf(stderr, "[  OK  ] MODE 0x%02X\n", mode_signal);
	}
	else {
		fprintf(stderr, "[FAILED] MODE 0x%02X\n", mode_signal);
		return;
	}

	//check if FPGA has received mode signal
	if (ReadFile(comport_handle, data_read, 16, &dw_byte_read, NULL)) {	//expected response is "Waiting CMD"
		fprintf(stderr, "[  OK  ] Response: ");
		for (int i = 0; i < 16; ++i) {
			fprintf(stderr, "%c", data_read[i]);
		}
		fprintf(stderr, "\n");
	}
	else {
		fprintf(stderr, "[FAILED] Response\n");
		return;
	}


	//send file metadata(DRAM base addr / file size)
	uint32_t encoded_data[2];
	encoded_data[0] = base_addr;
	encoded_data[1] = words_to_recv;

	if (WriteFile(comport_handle, &encoded_data, 8, &dw_byte_written, NULL)) {
		fprintf(stderr, "[  OK  ] SEND CMD\n");
	}
	else {
		fprintf(stderr, "[FAILED] SEND CMD\n");
		return;
	}

	if (ReadFile(comport_handle, &data_read, 16, &dw_byte_read, NULL)) { //expected response is "CMD receive"
		fprintf(stderr, "[  OK  ] Response: ");
		for (int i = 0; i < 16; i++) {
			fprintf(stderr, "%c", data_read[i]);
		}
		fprintf(stderr, "\n");
	}
	else {
		fprintf(stderr, "[FAILED] Resonse:\n");
		return;
	}


	//receive file back and verify (word by word)
	uint32_t tmp_buffer;

	for (int i = 0; i < words_to_recv; i++) {
		if (ReadFile(comport_handle, &tmp_buffer, sizeof(uint32_t), &dw_byte_read, NULL)) {
			if (tmp_buffer != buffer[i]) {
				fprintf(stderr, "[FAILED] DATA MISMATCHED\n");
				fprintf(stderr, "LINE #%d\n", i);
				fprintf(stderr, "EXPECTED: %X\n", buffer[i]);
				fprintf(stderr, "RECEIVED: %X\n", tmp_buffer);
				free(buffer);
				return;
			}
			else {
				if (i % 200 == 0 || i == words_to_recv - 1) {
					fprintf(stderr, "[  OK  ] DATA MATCHED\n");
					fprintf(stderr, "LINE #%d\n", i);
				}
			}
		}
	}

	fprintf(stderr, "[  OK  ] VERIFY %s\n", file_name);


	free(buffer);
}

void store_testip(void* comport_handle, uint32_t offset, uint32_t data) {

	//send 1-byte command to board
	DWORD dw_byte_written = 0;
	DWORD dw_byte_read = 0;
	uint8_t mode_signal = MODE_STORE_TEST;

	if (WriteFile(comport_handle, &mode_signal, 1, &dw_byte_written, NULL)) {
		fprintf(stderr, "[  OK  ] MODE 0x%02X\n", mode_signal);
	}
	else {
		fprintf(stderr, "[FAILED] MODE 0x%02X\n", mode_signal);
		return;
	}

	//check if FPGA has received mode signal
	if (ReadFile(comport_handle, data_read, 16, &dw_byte_read, NULL)) {	//expected response is "Waiting CMD"
		fprintf(stderr, "[  OK  ] Response: ");
		for (int i = 0; i < 16; ++i) {
			fprintf(stderr, "%c", data_read[i]);
		}
		fprintf(stderr, "\n");
	}
	else {
		fprintf(stderr, "[FAILED] Response\n");
		return;
	}

	
	//send address offset and data to store
	uint32_t encoded_data[2];
	encoded_data[0] = offset;//4 bytes
	encoded_data[1] = data;//4 bytes
	fprintf(stderr, "sending data to : \t0x%02X\n", encoded_data[0]);
	fprintf(stderr, "data to send is : \t0x%X\n", encoded_data[1]);

	if (WriteFile(comport_handle, &encoded_data, 8, &dw_byte_written, NULL)) {
		fprintf(stderr, "[  OK  ] SEND CMD\n");
	}
	else {
		fprintf(stderr, "[FAILED] SEND CMD\n");
		return;
	}

	if (ReadFile(comport_handle, &data_read, 16, &dw_byte_read, NULL)) { //expected response is "Store Complete"
		fprintf(stderr, "[  OK  ] Response ");
		for (int i = 0; i < 16; i++) {
			fprintf(stderr, "%c", data_read[i]);
		}
		//for (int i = 0; i < 100; i++){
		//	fprintf(stderr, "%c", data_read[i]);
		//}
		fprintf(stderr, "\n");
	}
	else {
		fprintf(stderr, "[FAILED] Resonse:\n");
		return;
	}
}

void load_testip(void* comport_handle, uint32_t offset) {
	
	//send 1-byte command to board
	DWORD dw_byte_written = 0;
	DWORD dw_byte_read = 0;
	uint8_t mode_signal = MODE_LOAD_TEST;

	if (WriteFile(comport_handle, &mode_signal, 1, &dw_byte_written, NULL)) {
		fprintf(stderr, "[  OK  ] MODE 0x%02X\n", mode_signal);
	}
	else {
		fprintf(stderr, "[FAILED] MODE 0x%02X\n", mode_signal);
		return;
	}

	//check if FPGA has received mode signal
	if (ReadFile(comport_handle, data_read, 16, &dw_byte_read, NULL)) {	//expected response is "Waiting CMD"
		fprintf(stderr, "[  OK  ] Response: ");
		for (int i = 0; i < 16; ++i) {
			fprintf(stderr, "%c", data_read[i]);
		}
		fprintf(stderr, "\n");
	}
	else {
		fprintf(stderr, "[FAILED] Response\n");
		return;
	}

	//send address offset
	if (WriteFile(comport_handle, &offset, 4, &dw_byte_written, NULL)) {
		fprintf(stderr, "[  OK  ] SEND OFFSET\n");
	}
	else {
		fprintf(stderr, "[FAILED] SEND OFFSET\n");
		return;
	}

	//receive register data
	uint32_t tmp_buffer;
	if (ReadFile(comport_handle, &tmp_buffer, sizeof(uint32_t), &dw_byte_read, NULL)) {
		fprintf(stderr, "[  OK  ] Response: 0x%08X\n", tmp_buffer);
	}
	else {
		fprintf(stderr, "[FAILED] Resonse:\n");
		return;
	}

}