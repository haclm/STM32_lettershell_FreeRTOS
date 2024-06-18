################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../letter-shell-master/shell.c \
../letter-shell-master/shell_cmd_list.c \
../letter-shell-master/shell_companion.c \
../letter-shell-master/shell_ext.c \
../letter-shell-master/shell_port.c 

OBJS += \
./letter-shell-master/shell.o \
./letter-shell-master/shell_cmd_list.o \
./letter-shell-master/shell_companion.o \
./letter-shell-master/shell_ext.o \
./letter-shell-master/shell_port.o 

C_DEPS += \
./letter-shell-master/shell.d \
./letter-shell-master/shell_cmd_list.d \
./letter-shell-master/shell_companion.d \
./letter-shell-master/shell_ext.d \
./letter-shell-master/shell_port.d 


# Each subdirectory must supply rules for building sources it contributes
letter-shell-master/%.o letter-shell-master/%.su letter-shell-master/%.cyclo: ../letter-shell-master/%.c letter-shell-master/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L053xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM0 -I"D:/Microcontroller/STM32Cubeworkspace/FreeRTOS/letter-shell-master" -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-letter-2d-shell-2d-master

clean-letter-2d-shell-2d-master:
	-$(RM) ./letter-shell-master/shell.cyclo ./letter-shell-master/shell.d ./letter-shell-master/shell.o ./letter-shell-master/shell.su ./letter-shell-master/shell_cmd_list.cyclo ./letter-shell-master/shell_cmd_list.d ./letter-shell-master/shell_cmd_list.o ./letter-shell-master/shell_cmd_list.su ./letter-shell-master/shell_companion.cyclo ./letter-shell-master/shell_companion.d ./letter-shell-master/shell_companion.o ./letter-shell-master/shell_companion.su ./letter-shell-master/shell_ext.cyclo ./letter-shell-master/shell_ext.d ./letter-shell-master/shell_ext.o ./letter-shell-master/shell_ext.su ./letter-shell-master/shell_port.cyclo ./letter-shell-master/shell_port.d ./letter-shell-master/shell_port.o ./letter-shell-master/shell_port.su

.PHONY: clean-letter-2d-shell-2d-master

