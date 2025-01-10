# This is converter generated file, and shall not be touched by user
#
# Use CMakeLists.txt to apply user changes
cmake_minimum_required(VERSION 3.22)

# Core MCU flags, CPU, instruction set and FPU setup
set(cpu_PARAMS ${cpu_PARAMS}
    -mthumb

    # Other parameters
    # -mcpu, -mfloat, -mfloat-abi, ...
    -mcpu=cortex-m7
	-mfpu=fpv5-sp-d16
	-mfloat-abi=hard
	
)

# Linker script
set(linker_script_SRC ${linker_script_SRC}
    ${CMAKE_CURRENT_SOURCE_DIR}/stm32f746nghx_FLASH.ld
)

# Sources
set(sources_SRCS ${sources_SRCS}
    
    ${CMAKE_CURRENT_SOURCE_DIR}/Src/stm32f7xx_hal_msp.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Src/stm32f7xx_it.c
	${CMAKE_CURRENT_SOURCE_DIR}/Src/main.c
	${CMAKE_CURRENT_SOURCE_DIR}/Src/syscall.c
	${CMAKE_CURRENT_SOURCE_DIR}/Src/sysmem.c
	${CMAKE_CURRENT_SOURCE_DIR}/Startup/startup_stm32f746nghx.s
	${CMAKE_CURRENT_SOURCE_DIR}/Drivers/CMSIS/Device/ST/STM32F7xx/Source/Templates/system_stm32f7xx.c
	${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_rcc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_rcc_ex.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_pwr.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_pwr_ex.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_gpio.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_cortex.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_ll_fmc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_sdram.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_ltdc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_dma.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_dma2d.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/BSP/STM32746G-Discovery/stm32746g_discovery_sdram.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/BSP/STM32746G-Discovery/stm32746g_discovery_lcd.c
)

# Include directories
set(include_c_DIRS ${include_c_DIRS}

	${CMAKE_CURRENT_SOURCE_DIR}/Inc
	${CMAKE_CURRENT_SOURCE_DIR}/Drivers/BSP/STM32746G-Discovery
	${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F7xx_HAL_Driver/Inc
	${CMAKE_CURRENT_SOURCE_DIR}/Drivers/CMSIS/Device/ST/STM32F7xx/Include
	${CMAKE_CURRENT_SOURCE_DIR}/Drivers/CMSIS/Core/Include
	${CMAKE_CURRENT_SOURCE_DIR}/Drivers/CMSIS/DSP/Include
)
set(include_cxx_DIRS ${include_cxx_DIRS}
    
)
set(include_asm_DIRS ${include_asm_DIRS}
    
)

# Symbols definition
set(symbols_c_SYMB ${symbols_c_SYMB}

)
set(symbols_cxx_SYMB ${symbols_cxx_SYMB}
    
)
set(symbols_asm_SYMB ${symbols_asm_SYMB}
    
)

# Link directories
set(link_DIRS ${link_DIRS}
    
)

# Link libraries
set(link_LIBS ${link_LIBS}

	${CMAKE_CURRENT_SOURCE_DIR}/Drivers/CMSIS/Lib/GCC/libarm_cortexM7lfdp_math.a
)

# Compiler options
set(compiler_OPTS ${compiler_OPTS})

# Linker options
set(linker_OPTS ${linker_OPTS})
