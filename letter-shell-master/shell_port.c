/**
 * @file shell_port.c
 * @author Letter (NevermindZZT@gmail.com)
 * @brief 
 * @version 0.1
 * @date 2019-02-22
 * 
 * @copyright (c) 2019 Letter
 * 
 */

#include "FreeRTOS.h"
#include "task.h"
#include "shell.h"
//#include "serial.h"
#include "stm32l0xx_hal.h"
#include "usart.h"
//#include "cevent.h"
//#include "log.h"
#include "semphr.h"
#include "shell_port.h"


Shell shell;
char shellBuffer[512];
static SemaphoreHandle_t shellMutex;
/**
 * @brief 用户shell写
 * 
 * @param data 数据
 * @param len 数据长度
 * 
 * @return short 实际写入的数据长度
 */
short userShellWrite(char *data, unsigned short len)
{
//    serialTransmit(&debugSerial, (uint8_t *)data, len, 0x1FF);
	HAL_UART_Transmit(&huart1, (uint8_t *)data, len, 0x1FF);
    return len;
}


/**
 * @brief 用户shell读
 * 
 * @param data 数据
 * @param len 数据长度
 * 
 * @return short 实际读取到
 */
short userShellRead(char *data, unsigned short len)
{
 //   return serialReceive(&debugSerial, (uint8_t *)data, len, 0);
//	return HAL_UART_Receive_IT(&huart1, (uint8_t*)&data, 1)
//	if ( HAL_UART_Receive_IT(&huart1, (uint8_t*)&data, 1) != HAL_OK)
	if(HAL_UART_Receive(&huart1, (uint8_t*)data, len, 0xFFFF) != HAL_OK)
////	if(HAL_UART_Receive_IT(&huart1, (uint8_t*)data, len))
	{
		return 0;
	}
	else
	{

		return 1;
	}
}

/**
 * @brief 用户shell上锁
 * 
 * @param shell shell
 * 
 * @return int 0
 */
int userShellLock(Shell *shell)
{
//    xSemaphoreTakeRecursive(shellMutex, portMAX_DELAY);
    xSemaphoreTake(shellMutex, portMAX_DELAY);
    return 0;
}

/**
 * @brief 用户shell解锁
 * 
 * @param shell shell
 * 
 * @return int 0
 */
int userShellUnlock(Shell *shell)
{
//    xSemaphoreGiveRecursive(shellMutex);
    xSemaphoreGive(shellMutex);
    return 0;
}

/**
 * @brief 用户shell初始化
 * 
 */
void userShellInit(void)
{
    shellMutex = xSemaphoreCreateMutex();

    shell.write = userShellWrite;
    shell.read = userShellRead;
    shell.lock = userShellLock;
    shell.unlock = userShellUnlock;
    shellInit(&shell, shellBuffer, 512);
//    xTaskCreate(shellTask, "shell", 256, &shell, 5, NULL);
}
CEVENT_EXPORT(EVENT_INIT_STAGE2, userShellInit);

