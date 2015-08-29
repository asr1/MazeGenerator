//Created by Ben Myshkowec

#ifndef LIBBMP_H
#define LIBBMP_H

#include <stdint.h>

// bmp_pixel_t * get_bmp_pixel(bmp_info_t *bmp_info, int row, int column)
#define bmp_pixels(bmp_info, row, column) ((bmp_info)->pixels + ((row) * (bmp_info)->width) + (column))

typedef struct
{
	uint8_t alpha;
	uint8_t red;
	uint8_t green;
	uint8_t blue;
} bmp_pixel_t;

typedef struct
{
    // bitmap width and height in pixels
    int32_t width;
    int32_t height;
    /* the 2D pixel array representing the bitmap image
     * type is (*pixels)[height][width]
     * access with bmp_pixels()
     * create with calloc(width * height, sizeof(bmp_pixel_t))
     */
    bmp_pixel_t (*pixels);
} bmp_info_t;

int bmp_write(const char *path, bmp_info_t *info);
bmp_pixel_t get_bmp_pixel(uint8_t alpha, uint8_t red, uint8_t green, uint8_t blue);

#endif
