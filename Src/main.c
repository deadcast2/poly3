#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include "arm_math.h"
#include "stm32f7xx_hal.h"
#include "stm32746g_discovery.h"
#include "stm32746g_discovery_lcd.h"
#include "stm32746g_discovery_sdram.h"

void SystemClock_Config(void);
void Draw_Line(int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint16_t color);
void Put_Pixel(int16_t x, int16_t y, uint16_t color);

int main(void)
{
  HAL_Init();
  SystemClock_Config();
  BSP_SDRAM_Init();
  BSP_LCD_Init();

  // Initialize LCD layer
  BSP_LCD_LayerRgb565Init(0, LCD_FB_START_ADDRESS);
  BSP_LCD_SetLayerWindow(0, 112, 40, 256, 192); // DS resolution
  BSP_LCD_SelectLayer(0);
  BSP_LCD_DisplayOn();
  BSP_LCD_Clear(LCD_COLOR_BLACK);

  Draw_Line(-20, -10, 20, 10, 0xF800 /* red */);
  Draw_Line(-40, -20, -30, 20, 0x1F80 /* green */);

  while (1)
  {
    HAL_Delay(16); // Cap at ~60 FPS
  }
}

void Draw_Line(int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint16_t color)
{
  if (x1 > x2)
  {
    int16_t temp = x2;
    x2 = x1;
    x1 = temp;
  }

  int32_t a = roundf((float32_t)(y2 - y1) / (x2 - x1));
  int32_t y = y1;

  for (int16_t x = x1; x <= x2; x++)
  {
    Put_Pixel(x, y, color);

    y = y + a;
  }
}

void Put_Pixel(int16_t x, int16_t y, uint16_t color)
{
  uint16_t sx = (256 / 2) + x;
  uint16_t sy = (192 / 2) - y;

  BSP_LCD_DrawPixel(sx, sy, color);
}

void SystemClock_Config(void)
{
  RCC_ClkInitTypeDef RCC_ClkInitStruct;
  RCC_OscInitTypeDef RCC_OscInitStruct;
  HAL_StatusTypeDef ret = HAL_OK;

  /* Enable HSE Oscillator and activate PLL with HSE as source */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLM = 25;
  RCC_OscInitStruct.PLL.PLLN = 432;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = 9;

  ret = HAL_RCC_OscConfig(&RCC_OscInitStruct);
  if (ret != HAL_OK)
  {
    while (1)
    {
      ;
    }
  }

  /* Activate the OverDrive to reach the 216 MHz Frequency */
  ret = HAL_PWREx_EnableOverDrive();
  if (ret != HAL_OK)
  {
    while (1)
    {
      ;
    }
  }

  /* Select PLL as system clock source and configure the HCLK, PCLK1 and PCLK2 clocks dividers */
  RCC_ClkInitStruct.ClockType = (RCC_CLOCKTYPE_SYSCLK | RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2);
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;

  ret = HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_7);
  if (ret != HAL_OK)
  {
    while (1)
    {
      ;
    }
  }
}