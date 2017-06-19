clear all
close all
%current data
v_measured = (5/1024) * [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 2, 2, 4, 4, 5, 5, 6, 6, 7, 7, 9, 9, 10, 10, 12, 12, 13, 13, 14, 15, 16, 16, 17, 17, 19, 19, 20, 20, 22, 21, 23, 23, 24, 24, 26, 26, 27, 27, 28, 28, 29, 29, 30, 31, 32, 32, 33, 33, 34, 34, 35, 35, 36, 37, 38, 38, 39, 39, 41, 40, 41, 42, 43, 43, 44, 44, 45, 45, 46, 46, 46, 47, 48, 48, 48, 49, 50, 50, 51, 51, 52, 52, 53, 53, 54, 55, 55, 56, 56, 56, 57, 58, 57, 58, 58, 59, 59, 60, 61, 61, 61, 61, 62, 62, 63, 63, 64, 64, 64, 65, 65, 65, 66, 66, 67, 68, 67, 68, 68, 69, 69, 70, 70, 70, 71, 71, 72, 71, 72, 72, 73, 74, 74, 74, 75, 75, 75, 76, 76, 77, 76, 76, 78, 78, 78, 79, 79, 79, 79, 80, 80, 80, 81, 81, 81, 82, 81, 82, 83, 83, 84, 83, 84, 84, 84, 84, 84, 84, 86, 86, 86, 86, 87, 87, 87, 87, 88, 89, 88, 89, 89, 89, 89, 90, 91, 91, 91, 91, 91, 92, 92, 92, 93, 93, 93, 93, 94, 94, 93, 94, 95, 95, 95, 96, 95, 96, 95, 96, 96, 97, 97, 97, 97, 98, 97, 97, 98, 99, 99, 99, 98, 99, 98, 99, 100, 100, 100, 101, 101, 101, 101, 101, 102, 102, 102, 102, 103, 102, 103, 104, 103, 103, 104, 104, 103, 105, 105, 105, 105, 105, 106, 106, 106, 106, 105, 107, 107, 107, 107, 107, 107, 108, 107, 107, 107, 108, 109, 109, 109, 109, 109, 109, 110, 109, 110, 110, 110, 110, 112, 110, 111, 111, 111, 112, 112, 111, 112, 113, 113, 113, 112, 113, 112, 113, 113, 113, 113, 114, 114, 116, 114, 115, 114, 115, 114, 115, 115, 116, 116, 115, 115, 115, 115, 116, 116, 117, 117, 117, 117, 117, 117, 117, 118, 118, 117, 118, 118, 118, 117, 119, 119, 118, 118, 119, 119, 119, 119, 119, 119, 120, 119, 120, 120, 121, 120, 120, 121, 121, 120, 121, 121, 121, 121, 122, 121, 121, 121, 123, 122, 123, 122, 122, 122, 122, 123, 122, 123, 123, 122, 124, 124, 123, 124, 124, 123, 125, 124, 125, 125, 125, 125, 126, 125, 125, 125, 126, 126, 126, 126, 127, 126, 127, 127, 127, 127, 127, 127, 127, 127, 128, 128, 128, 128, 128, 127, 128, 127, 128, 128, 128, 129, 129, 128, 128, 129, 129, 129, 129, 128, 129, 129, 130, 129, 129, 130, 129, 130, 130];
v = (v_measured(1:2:end) + v_measured(2:2:end))/2;
i_A = v/18;
i_mA = i_A * 1000;

%channel 1 measures the 830nm LED
%channel 0 measures the 660nm LED
data100kOhm10pF_ch0 = (5/1023)*[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 2, 2, 2, 2, 2, 2, 2, 1, 2, 0, 2, 2, 2, 3, 3, 3, 2, 2, 3, 2, 1, 3, 3, 2, 1, 4, 4, 2, 2, 2, 2, 4, 2, 4, 5, 5, 5, 5, 3, 3, 4, 3, 3, 5, 5, 5, 6, 4, 5, 6, 6, 6, 5, 5, 6, 6, 5, 4, 4, 6, 4, 6, 6, 5, 4, 6, 7, 5, 5, 5, 7, 5, 7, 7, 7, 7, 5, 7, 7, 7, 7, 7, 6, 7, 7, 5, 5, 6, 7, 8, 8, 6, 6, 8, 7, 7, 5, 6, 8, 8, 7, 6, 7, 7, 8, 7, 8, 7, 8, 8, 7, 8, 8, 8, 9, 8, 8, 6, 8, 8, 6, 7, 7, 6, 6, 9, 8, 7, 6, 9, 9, 8, 8, 8, 8, 9, 8, 9, 9, 9, 9, 9, 7, 7, 6, 8, 9, 9, 8, 9, 8, 8, 9, 9, 9, 7, 10, 8, 9, 9, 7, 8, 9, 7, 7, 9, 7, 7, 9, 10, 8, 9, 10, 7, 8, 8, 9, 10, 8, 10, 10, 8, 10, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 2, 1, 0, 1, 2, 1, 1, 2, 1, 1, 2, 1, 1, 1, 2, 3, 3, 3, 2, 3, 2, 4, 3, 2, 1, 3, 1, 2, 4, 3, 2, 2, 2, 4, 3, 4, 4, 4, 5, 5, 5, 5, 4, 5, 4, 3, 5, 3, 5, 6, 5, 5, 6, 4, 5, 6, 6, 4, 6, 5, 6, 5, 4, 4, 6, 6, 5, 7, 4, 5, 7, 5, 7, 5];
data100kOhm10pF_ch1 = (5/1023)*[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 4, 5, 8, 7, 10, 12, 13, 15, 14, 16, 16, 19, 22, 21, 23, 25, 26, 28, 30, 30, 31, 33, 33, 35, 38, 38, 41, 40, 43, 42, 46, 45, 47, 49, 50, 51, 53, 53, 55, 56, 56, 58, 59, 60, 61, 60, 61, 62, 65, 64, 65, 68, 68, 68, 69, 71, 73, 73, 74, 75, 73, 76, 76, 79, 79, 79, 80, 81, 81, 83, 82, 84, 83, 85, 87, 86, 86, 89, 90, 88, 91, 91, 92, 93, 94, 94, 95, 95, 96, 96, 97, 98, 96, 97, 97, 99, 99, 100, 100, 100, 103, 103, 104, 102, 103, 106, 106, 104, 107, 107, 107, 109, 106, 108, 110, 110, 111, 110, 110, 111, 113, 113, 113, 113, 114, 112, 114, 115, 114, 116, 116, 117, 118, 117, 118, 119, 119, 119, 118, 118, 121, 119, 121, 120, 121, 122, 122, 123, 123, 123, 124, 124, 124, 124, 123, 125, 126, 125, 125, 127, 125, 128, 128, 127, 129, 129, 127, 129, 129, 130, 129, 130, 131, 131, 132, 131, 131, 132, 133, 131, 134, 133, 133, 132, 135, 133, 135, 135, 135, 136, 135, 134, 137, 137, 137, 135, 136, 136, 137, 138, 138, 137, 137, 139, 137, 140, 139, 140, 138, 140, 139, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 3, 3, 5, 6, 7, 9, 11, 12, 13, 16, 17, 17, 20, 20, 23, 25, 26, 27, 29, 29, 29, 32, 33, 36, 36, 37, 39, 39, 40, 42, 43, 43, 46, 48, 49, 50, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 61, 64, 64, 65, 65, 68, 68, 69, 70, 72, 71, 73, 74, 75, 74, 76, 78, 78, 78, 78, 81, 82, 83, 82, 84, 84, 85, 84, 87, 86, 87, 86, 89, 89, 89, 90, 91, 92, 93, 93, 93, 96, 96, 96, 95, 97, 98, 98, 100, 100, 100, 100, 101];
data1MOhm10pF_ch0 = (5/1023)*[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 3, 6, 5, 7, 8, 10, 13, 12, 15, 17, 18, 19, 19, 22, 22, 25, 27, 28, 29, 30, 32, 32, 34, 35, 35, 37, 38, 40, 40, 43, 42, 43, 46, 48, 48, 49, 51, 51, 52, 51, 54, 54, 54, 58, 58, 60, 59, 60, 63, 62, 63, 63, 64, 65, 66, 68, 68, 71, 69, 70, 72, 74, 74, 74, 75, 77, 77, 78, 79, 78, 79, 79, 80, 82, 83, 81, 84, 84, 84, 86, 87, 86, 88, 87, 87, 90, 91, 90, 90, 93, 93, 93, 94, 95, 95, 95, 95, 96, 95, 96, 98, 99, 98, 99, 98, 101, 100, 102, 102, 101, 102, 102, 102, 104, 103, 105, 105, 105, 107, 107, 107, 107, 107, 109, 110, 110, 109, 109, 110, 111, 112, 111, 111, 113, 112, 113, 112, 112, 115, 114, 113, 114, 116, 116, 117, 117, 116, 115, 118, 117, 119, 117, 117, 119, 118, 120, 120, 121, 120, 120, 120, 119, 122, 120, 121, 121, 123, 123, 124, 125, 122, 125, 123, 123, 126, 124, 126, 125, 127, 125, 127, 127, 128, 126, 126, 128, 129, 129, 128, 129, 128, 130, 129, 131, 128, 131, 130, 130, 129, 131, 130, 132, 132, 132, 131, 131, 132, 132, 133, 134, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 3, 3, 4, 6, 7, 9, 10, 12, 14, 15, 17, 18, 18, 20, 23, 23, 25, 26, 26, 28, 29, 30, 33, 34, 35, 37, 37, 38, 40, 41, 42, 44, 43, 44, 46, 46, 48, 50, 49, 52, 54, 53, 56, 57, 58, 59, 60, 61, 61, 61, 62, 65, 66, 66, 65, 68, 68, 70, 69, 69, 72, 73, 72, 74, 75, 76, 76, 77, 78, 79, 79, 79, 81, 80, 82, 82, 84, 82, 84, 85, 86, 87, 87, 89, 88, 90, 91, 89, 90, 90, 91, 93, 92, 93, 93, 96, 96, 95, 97];
data1MOhm10pF_ch1 = (5/1023)*[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 7, 13, 23, 32, 44, 58, 71, 88, 104, 120, 134, 151, 168, 187, 202, 220, 237, 255, 272, 289, 305, 323, 338, 354, 372, 389, 404, 419, 436, 450, 466, 482, 495, 511, 548, 547, 546, 546, 548, 547, 546, 547, 548, 548, 546, 547, 548, 548, 548, 548, 549, 547, 549, 549, 547, 549, 548, 546, 548, 548, 548, 548, 549, 548, 547, 549, 549, 547, 549, 549, 549, 547, 549, 547, 549, 549, 549, 549, 548, 548, 549, 549, 549, 549, 548, 550, 547, 548, 548, 548, 549, 548, 548, 550, 550, 548, 549, 550, 548, 549, 550, 548, 549, 549, 549, 549, 548, 548, 550, 548, 549, 548, 550, 550, 548, 549, 548, 550, 549, 548, 550, 550, 550, 548, 549, 548, 549, 549, 549, 550, 548, 548, 550, 548, 549, 549, 550, 550, 549, 548, 550, 549, 548, 549, 550, 550, 551, 550, 549, 551, 549, 550, 550, 550, 550, 551, 551, 550, 549, 551, 550, 552, 550, 550, 551, 551, 550, 551, 550, 551, 551, 550, 549, 552, 549, 551, 552, 551, 549, 550, 551, 551, 551, 551, 550, 551, 551, 550, 550, 550, 551, 549, 550, 550, 550, 551, 551, 551, 551, 552, 552, 551, 552, 552, 551, 550, 550, 551, 550, 552, 552, 552, 550, 552, 552, 550, 552, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 8, 15, 23, 34, 44, 58, 72, 88, 102, 120, 137, 153, 171, 186, 205, 223, 237, 256, 273, 289, 308, 325, 341, 358, 373, 391, 406, 421, 438, 452, 469, 483, 500, 510, 549, 548, 550, 550, 548, 550, 550, 549, 550, 550, 548, 551, 551, 550, 550, 549, 548, 549, 551, 550, 549, 549, 548, 550, 550, 550, 549, 550, 551, 549, 551, 551, 551, 551, 550, 549, 551, 551, 548, 550, 551, 551, 551, 549, 550, 551, 550, 550, 549, 550, 549, 552, 551, 550, 550, 551, 551, 550, 551, 552, 550, 552, 552, 551, 550, 550, 552, 552, 551, 550, 551];
data2_2MOhm10pF_ch0 = (5/1023)*[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 4, 5, 9, 11, 12, 16, 17, 22, 24, 28, 31, 33, 35, 38, 41, 45, 47, 51, 54, 55, 59, 63, 65, 68, 70, 74, 74, 77, 81, 83, 86, 89, 90, 94, 97, 98, 100, 103, 106, 108, 110, 112, 113, 114, 117, 121, 123, 123, 127, 127, 130, 131, 133, 136, 136, 140, 140, 144, 145, 148, 149, 149, 153, 153, 156, 155, 157, 161, 161, 162, 163, 166, 167, 170, 171, 172, 172, 175, 177, 178, 179, 181, 182, 183, 183, 186, 187, 188, 188, 190, 191, 192, 194, 196, 197, 199, 198, 201, 202, 201, 203, 205, 206, 207, 208, 207, 209, 209, 212, 213, 213, 216, 215, 216, 218, 218, 220, 222, 222, 221, 224, 225, 226, 226, 226, 228, 229, 229, 229, 231, 230, 233, 233, 235, 236, 237, 236, 237, 238, 238, 239, 240, 241, 242, 244, 242, 245, 245, 246, 246, 247, 247, 248, 248, 250, 249, 252, 253, 252, 254, 255, 254, 255, 255, 257, 258, 258, 257, 259, 259, 258, 261, 262, 260, 261, 262, 264, 263, 265, 266, 266, 267, 266, 267, 268, 268, 269, 268, 270, 269, 272, 270, 271, 272, 272, 273, 273, 274, 274, 276, 276, 275, 275, 277, 278, 277, 279, 278, 278, 280, 280, 281, 281, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 4, 4, 8, 11, 13, 16, 18, 21, 25, 27, 30, 32, 36, 38, 41, 46, 49, 51, 54, 56, 60, 62, 65, 68, 71, 73, 77, 79, 80, 85, 86, 88, 92, 93, 96, 99, 101, 104, 106, 108, 109, 113, 113, 117, 119, 121, 121, 125, 127, 129, 130, 133, 135, 135, 137, 141, 142, 144, 144, 147, 148, 151, 152, 153, 156, 157, 158, 161, 162, 164, 166, 167, 169, 171, 172, 173, 175, 175, 176, 178, 180, 182, 183, 184, 184, 187, 188, 189, 191, 190, 191, 194, 194, 196, 198, 199, 198, 202, 201, 202, 205];
data2_2MOhm10pF_ch1 = (5/1023)*[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 9, 17, 30, 45, 65, 86, 112, 140, 169, 197, 227, 260, 291, 324, 357, 388, 422, 453, 485, 547, 548, 548, 549, 547, 548, 547, 547, 547, 547, 547, 549, 549, 549, 548, 549, 547, 548, 548, 548, 550, 550, 550, 550, 549, 550, 550, 550, 550, 550, 551, 549, 551, 551, 549, 549, 550, 551, 551, 549, 550, 551, 552, 552, 553, 553, 552, 553, 553, 552, 553, 553, 553, 552, 553, 554, 554, 554, 554, 555, 554, 555, 556, 556, 555, 554, 557, 555, 557, 556, 556, 558, 558, 558, 557, 557, 558, 560, 558, 559, 560, 560, 560, 561, 560, 561, 560, 561, 561, 562, 562, 562, 563, 561, 561, 563, 562, 563, 564, 564, 565, 564, 565, 565, 566, 563, 565, 565, 566, 566, 566, 566, 566, 567, 567, 566, 567, 568, 566, 567, 567, 568, 568, 570, 569, 567, 568, 569, 569, 569, 568, 568, 569, 568, 569, 571, 571, 569, 570, 570, 572, 570, 572, 572, 572, 572, 573, 573, 572, 571, 572, 573, 573, 573, 574, 572, 574, 572, 573, 573, 574, 575, 573, 575, 575, 574, 575, 576, 575, 576, 576, 576, 575, 575, 576, 575, 577, 577, 576, 577, 577, 575, 577, 578, 576, 576, 578, 578, 578, 578, 577, 577, 578, 577, 577, 579, 578, 578, 578, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 7, 18, 30, 46, 65, 88, 115, 142, 171, 201, 230, 260, 294, 326, 358, 390, 425, 456, 490, 550, 550, 551, 550, 550, 551, 551, 552, 550, 551, 552, 551, 551, 551, 550, 550, 550, 552, 550, 552, 550, 552, 551, 552, 552, 551, 552, 553, 552, 552, 551, 552, 553, 551, 553, 551, 552, 554, 553, 554, 554, 552, 553, 554, 555, 555, 555, 555, 555, 555, 555, 556, 556, 555, 557, 557, 555, 556, 556, 557, 558, 558, 558, 559, 556, 559, 559, 559, 560, 560, 559, 560, 559, 560, 559, 561, 562, 560, 560, 560, 562, 563, 563, 562, 561, 564, 562];
data47MOhm10pF_ch0 = (5/1023)*[914, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 6, 12, 23, 39, 62, 89, 126, 165, 210, 257, 309, 364, 421, 478, 537, 593, 653, 712, 773, 833, 892, 914, 914, 914, 914, 913, 914, 913, 915, 914, 914, 915, 914, 910, 910, 915, 914, 911, 915, 914, 914, 914, 915, 914, 915, 914, 915, 910, 915, 915, 911, 914, 913, 914, 912, 914, 912, 914, 910, 915, 915, 912, 915, 915, 915, 914, 915, 916, 915, 911, 913, 916, 908, 916, 914, 915, 916, 910, 912, 914, 914, 911, 915, 909, 911, 914, 916, 916, 909, 916, 912, 909, 913, 915, 915, 916, 910, 916, 911, 911, 914, 914, 916, 916, 916, 916, 916, 916, 911, 912, 915, 912, 916, 916, 915, 915, 916, 916, 916, 916, 912, 911, 911, 912, 912, 914, 913, 916, 916, 917, 916, 917, 917, 917, 916, 911, 912, 916, 912, 913, 912, 912, 916, 916, 915, 916, 917, 918, 915, 917, 915, 917, 917, 916, 917, 910, 917, 912, 912, 917, 912, 913, 913, 912, 912, 914, 913, 914, 917, 918, 916, 917, 917, 916, 918, 917, 917, 918, 917, 918, 917, 917, 915, 916, 918, 913, 912, 919, 918, 917, 917, 918, 914, 914, 915, 914, 914, 913, 912, 916, 914, 917, 915, 915, 917, 917, 918, 918, 915, 917, 917, 918, 918, 916, 918, 918, 917, 918, 919, 918, 919, 918, 918, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 6, 14, 27, 44, 69, 101, 139, 182, 229, 279, 331, 387, 440, 498, 557, 615, 674, 734, 794, 854, 911, 920, 920, 916, 919, 919, 919, 915, 919, 920, 915, 921, 916, 920, 919, 918, 920, 920, 920, 914, 915, 916, 920, 919, 921, 913, 920, 920, 917, 920, 921, 920, 919, 915, 920, 914, 920, 920, 918, 919, 915, 920, 920, 917, 919, 921, 914, 916, 919, 921, 916, 920, 921, 921, 916, 918, 920, 921, 920, 920, 917, 917, 921, 921, 921, 921, 922, 917, 923, 922, 922, 915, 915, 914, 918, 921, 917, 921, 922, 921, 921, 921, 921, 918, 917, 921, 921, 921];
data47MOhm10pF_ch1 = (5/1023)*[909, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 4, 13, 29, 66, 133, 251, 437, 702, 914, 910, 914, 914, 909, 909, 914, 910, 914, 915, 915, 914, 913, 915, 914, 915, 911, 914, 914, 910, 909, 914, 914, 914, 910, 909, 913, 914, 914, 908, 913, 911, 915, 915, 910, 910, 911, 911, 911, 912, 913, 913, 913, 914, 915, 915, 915, 915, 915, 914, 915, 915, 915, 915, 915, 914, 915, 915, 915, 915, 915, 914, 915, 916, 916, 916, 916, 916, 915, 916, 916, 914, 909, 910, 909, 910, 909, 910, 910, 911, 911, 911, 911, 910, 911, 911, 911, 912, 912, 912, 911, 912, 912, 912, 912, 912, 912, 913, 913, 913, 913, 913, 913, 914, 915, 915, 915, 914, 914, 914, 915, 915, 914, 915, 915, 915, 915, 915, 916, 916, 915, 916, 916, 916, 917, 916, 916, 916, 916, 916, 916, 916, 917, 916, 916, 917, 917, 917, 916, 917, 917, 917, 916, 916, 918, 917, 917, 917, 917, 917, 917, 917, 917, 917, 917, 917, 917, 918, 918, 917, 918, 916, 917, 917, 919, 917, 917, 918, 918, 918, 917, 918, 918, 918, 918, 917, 917, 918, 918, 918, 918, 918, 918, 918, 919, 918, 918, 918, 918, 918, 918, 918, 918, 918, 917, 918, 918, 918, 918, 919, 918, 918, 918, 919, 919, 918, 918, 919, 918, 919, 918, 919, 919, 919, 919, 919, 918, 918, 918, 918, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 6, 17, 42, 95, 192, 356, 602, 920, 919, 919, 920, 913, 921, 920, 920, 920, 920, 920, 919, 919, 919, 919, 920, 920, 920, 916, 916, 920, 920, 920, 915, 917, 921, 921, 921, 920, 921, 916, 920, 920, 914, 915, 920, 920, 920, 921, 921, 920, 921, 921, 921, 921, 922, 921, 921, 921, 921, 920, 920, 921, 921, 921, 921, 918, 915, 915, 914, 914, 914, 916, 916, 916, 918, 917, 917, 916, 917, 916, 917, 917, 917, 917, 917, 917, 916, 918, 917, 918, 917, 918, 918, 917, 920, 918, 918, 918, 917, 917, 918, 918, 917, 918, 917, 918, 918, 918, 919, 918, 918, 918, 919, 919];
data100MOhm10pF_ch0 = (5/1023)*[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 8, 17, 33, 56, 90, 133, 186, 248, 314, 387, 467, 543, 626, 712, 799, 885, 938, 937, 935, 935, 932, 937, 932, 938, 933, 937, 936, 935, 936, 931, 932, 935, 936, 932, 937, 937, 933, 936, 936, 935, 933, 936, 936, 935, 933, 937, 937, 931, 936, 933, 937, 932, 937, 932, 937, 938, 934, 936, 937, 936, 937, 936, 933, 935, 936, 937, 934, 937, 937, 933, 936, 938, 933, 935, 936, 937, 932, 937, 932, 936, 937, 937, 937, 934, 934, 935, 937, 938, 937, 934, 931, 932, 934, 932, 937, 938, 937, 937, 938, 932, 931, 938, 932, 938, 935, 938, 935, 938, 937, 937, 938, 938, 930, 933, 934, 935, 937, 936, 937, 937, 936, 937, 938, 940, 937, 938, 938, 933, 932, 938, 934, 933, 931, 937, 937, 937, 936, 937, 937, 937, 937, 937, 938, 940, 939, 938, 933, 937, 930, 938, 932, 933, 935, 933, 933, 935, 930, 932, 934, 936, 933, 937, 936, 939, 938, 938, 938, 937, 938, 938, 937, 938, 939, 937, 938, 937, 938, 932, 931, 931, 931, 931, 938, 935, 933, 934, 933, 933, 935, 936, 934, 934, 934, 936, 936, 935, 932, 933, 936, 937, 938, 937, 937, 940, 939, 939, 939, 937, 938, 938, 937, 938, 938, 938, 939, 938, 939, 938, 937, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 8, 17, 32, 57, 90, 133, 185, 248, 315, 390, 467, 546, 628, 713, 801, 887, 939, 938, 939, 934, 937, 934, 939, 938, 938, 935, 934, 942, 940, 939, 939, 939, 939, 939, 938, 938, 939, 933, 934, 932, 939, 939, 939, 936, 933, 939, 933, 941, 938, 939, 939, 939, 935, 940, 933, 938, 933, 936, 937, 939, 934, 939, 939, 934, 937, 939, 939, 937, 939, 939, 940, 940, 938, 939, 939, 939, 932, 938, 936, 935, 939, 939, 940, 935, 937, 934, 940, 942, 941, 939, 935, 935, 936, 935, 939, 939, 940, 940, 939, 937, 934, 935, 936, 937, 937, 939, 939];
data100MOhm10pF_ch1 = (5/1023)*[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 11, 34, 81, 181, 362, 657, 935, 938, 938, 934, 933, 932, 937, 937, 937, 932, 932, 937, 938, 937, 934, 936, 936, 935, 937, 937, 938, 931, 936, 936, 937, 938, 932, 933, 933, 936, 937, 931, 934, 934, 938, 938, 931, 932, 932, 933, 935, 934, 934, 933, 934, 935, 935, 936, 936, 936, 936, 936, 937, 936, 937, 937, 936, 937, 937, 937, 939, 938, 938, 937, 938, 937, 937, 937, 937, 938, 938, 937, 937, 938, 938, 938, 938, 937, 938, 938, 940, 938, 939, 938, 937, 938, 938, 938, 937, 938, 938, 938, 938, 938, 937, 938, 937, 937, 938, 937, 940, 939, 939, 939, 939, 938, 938, 938, 939, 938, 938, 938, 939, 939, 938, 938, 939, 938, 939, 939, 941, 939, 939, 939, 939, 938, 938, 938, 939, 939, 939, 939, 938, 938, 939, 939, 939, 939, 939, 939, 940, 939, 939, 939, 938, 939, 938, 938, 939, 939, 939, 939, 939, 938, 938, 939, 938, 939, 938, 938, 941, 939, 939, 939, 939, 939, 939, 939, 938, 939, 939, 938, 939, 939, 939, 939, 939, 939, 938, 939, 941, 939, 939, 939, 938, 939, 939, 939, 939, 939, 939, 939, 939, 938, 939, 939, 939, 939, 938, 939, 941, 940, 939, 938, 939, 939, 939, 938, 939, 938, 939, 939, 940, 939, 939, 940, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 3, 12, 34, 80, 180, 361, 652, 938, 939, 939, 935, 940, 936, 938, 940, 939, 935, 935, 933, 940, 938, 933, 939, 939, 939, 939, 939, 935, 936, 939, 939, 942, 937, 935, 936, 936, 935, 940, 935, 938, 938, 939, 940, 935, 934, 936, 935, 935, 935, 936, 936, 939, 938, 939, 939, 939, 939, 939, 939, 939, 939, 940, 940, 939, 939, 940, 940, 940, 940, 940, 940, 942, 941, 940, 939, 940, 939, 939, 940, 940, 940, 940, 940, 939, 940, 940, 940, 939, 940, 940, 939, 942, 941, 941, 940, 940, 940, 940, 940, 940, 940, 940, 941, 939, 941, 940, 941, 941, 939, 941, 940];
data1GOhm10pF_ch0 = (5/1023)*[1, 2, 1, 1, 1, 1, 2, 2, 2, 2, 1, 1, 1, 0, 2, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 2, 1, 1, 0, 2, 2, 1, 2, 1, 2, 4, 8, 15, 28, 49, 83, 129, 191, 265, 353, 450, 556, 668, 778, 895, 935, 935, 937, 937, 933, 936, 933, 937, 938, 937, 939, 936, 938, 938, 934, 938, 937, 933, 937, 939, 939, 934, 935, 933, 932, 939, 939, 933, 933, 938, 939, 940, 939, 939, 938, 939, 938, 939, 938, 939, 939, 938, 940, 934, 937, 939, 934, 936, 939, 939, 941, 940, 935, 936, 939, 940, 933, 936, 935, 940, 939, 940, 933, 936, 939, 940, 941, 940, 939, 934, 937, 939, 938, 941, 941, 939, 936, 936, 937, 938, 940, 939, 940, 941, 942, 941, 942, 942, 942, 940, 940, 942, 940, 939, 941, 939, 942, 942, 942, 942, 942, 939, 937, 940, 940, 937, 941, 937, 939, 942, 943, 943, 943, 943, 941, 942, 943, 938, 938, 938, 939, 938, 937, 941, 940, 943, 943, 942, 942, 943, 945, 943, 942, 943, 943, 938, 943, 939, 944, 943, 937, 943, 938, 943, 939, 941, 943, 938, 939, 939, 945, 943, 942, 940, 938, 939, 943, 942, 944, 943, 944, 943, 943, 944, 944, 944, 944, 944, 944, 944, 947, 946, 945, 945, 938, 945, 945, 939, 938, 939, 940, 938, 944, 944, 939, 940, 940, 940, 938, 943, 946, 944, 943, 941, 944, 941, 944, 944, 945, 945, 944, 945, 943, 944, 944, 944, 1, 1, 1, 2, 0, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 2, 1, 2, 1, 2, 1, 1, 1, 0, 1, 1, 2, 1, 1, 2, 1, 0, 2, 2, 2, 4, 8, 15, 28, 50, 83, 132, 195, 271, 359, 457, 565, 678, 790, 909, 945, 942, 942, 945, 939, 940, 945, 943, 946, 940, 941, 942, 946, 939, 944, 947, 946, 940, 946, 945, 946, 940, 941, 942, 946, 946, 945, 944, 940, 945, 941, 945, 941, 941, 948, 946, 942, 945, 944, 945, 946, 944, 946, 939, 942, 946, 946, 942, 946, 946, 946, 943, 945, 946, 944, 941, 943, 946, 947, 947, 942, 942, 945, 943, 946, 947, 947, 941, 944, 943, 945, 946, 947, 947, 945, 942, 943, 946, 946, 947, 947, 947, 947, 948, 941, 942, 941, 946, 944, 945, 948, 948, 948, 948];
data1GOhm10pF_ch1 = (5/1023)*[2, 2, 1, 2, 2, 1, 2, 1, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 1, 1, 2, 2, 1, 1, 2, 1, 1, 3, 4, 10, 20, 49, 115, 249, 503, 913, 938, 936, 936, 937, 937, 936, 937, 937, 937, 932, 937, 937, 938, 937, 936, 938, 938, 939, 935, 938, 941, 939, 939, 938, 939, 939, 937, 938, 937, 938, 938, 939, 939, 939, 936, 939, 939, 940, 939, 939, 941, 940, 937, 940, 935, 933, 936, 940, 940, 940, 936, 940, 940, 939, 939, 940, 940, 939, 939, 939, 941, 941, 940, 941, 940, 940, 936, 939, 941, 941, 940, 940, 941, 941, 940, 940, 941, 941, 940, 940, 942, 942, 941, 941, 940, 941, 941, 942, 941, 942, 942, 942, 941, 942, 942, 942, 942, 943, 941, 943, 944, 943, 943, 943, 943, 943, 942, 943, 939, 940, 942, 942, 943, 943, 942, 943, 943, 943, 943, 943, 945, 944, 943, 944, 942, 941, 943, 942, 937, 938, 937, 938, 942, 942, 944, 943, 944, 944, 944, 943, 945, 943, 945, 944, 944, 945, 944, 944, 944, 944, 944, 944, 944, 944, 945, 944, 944, 944, 945, 944, 946, 945, 944, 945, 944, 944, 944, 944, 944, 945, 945, 945, 943, 943, 945, 944, 945, 945, 945, 945, 947, 945, 946, 946, 946, 946, 946, 945, 944, 945, 945, 946, 944, 945, 944, 946, 945, 945, 945, 946, 947, 947, 947, 946, 946, 946, 946, 946, 946, 946, 946, 946, 946, 945, 947, 945, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 0, 1, 2, 1, 1, 2, 2, 2, 1, 1, 2, 2, 2, 1, 2, 2, 5, 10, 21, 50, 117, 254, 514, 931, 947, 947, 947, 945, 948, 947, 942, 946, 947, 946, 946, 942, 945, 946, 946, 940, 946, 947, 947, 947, 947, 946, 947, 941, 945, 941, 948, 940, 948, 946, 947, 940, 947, 947, 947, 947, 947, 947, 947, 941, 947, 947, 947, 947, 948, 946, 946, 947, 947, 947, 947, 947, 947, 948, 947, 942, 940, 941, 947, 941, 947, 947, 948, 942, 949, 949, 948, 948, 947, 947, 947, 942, 942, 942, 948, 942, 947, 947, 948, 942, 941, 941, 947, 941, 950, 946, 949, 943, 941, 943, 948, 943, 949, 949, 948, 942, 949, 947, 948, 946, 949, 949, 948, 943];

data2_2MOhm10pF_ch0_2 = (5/1023)*[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 4, 6, 9, 11, 15, 19, 21, 23, 28, 30, 34, 38, 40, 45, 48, 52, 56, 58, 61, 64, 67, 71, 73, 79, 81, 83, 87, 91, 93, 95, 98, 101, 103, 107, 110, 114, 116, 119, 122, 123, 126, 129, 130, 132, 137, 139, 141, 144, 144, 148, 151, 151, 155, 157, 157, 159, 162, 164, 168, 169, 172, 173, 176, 177, 180, 181, 182, 185, 187, 187, 189, 192, 192, 196, 196, 197, 201, 201, 203, 205, 206, 209, 209, 210, 213, 215, 215, 216, 217, 220, 222, 222, 223, 226, 227, 227, 228, 232, 231, 234, 235, 236, 236, 237, 240, 240, 243, 243, 244, 246, 248, 248, 250, 251, 250, 251, 254, 256, 255, 256, 258, 259, 260, 262, 262, 262, 265, 265, 265, 267, 268, 270, 271, 270, 272, 273, 274, 274, 276, 275, 276, 279, 278, 280, 281, 281, 283, 282, 283, 284, 286, 286, 288, 288, 289, 289, 291, 292, 293, 291, 294, 295, 293, 295, 296, 297, 297, 299, 298, 301, 300, 300, 302, 303, 303, 304, 303, 305, 306, 306, 308, 308, 308, 309, 310, 310, 310, 312, 313, 312, 312, 314, 314, 314, 316, 317, 315, 318, 318, 317, 318, 320, 320, 321, 320, 322, 321, 322, 324, 324, 323, 325, 326, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 5, 8, 10, 12, 16, 18, 21, 24, 28, 33, 36, 38, 42, 46, 49, 52, 57, 60, 63, 66, 70, 73, 76, 79, 82, 85, 89, 92, 94, 97, 100, 102, 105, 108, 111, 114, 116, 118, 121, 125, 126, 129, 131, 136, 138, 141, 142, 146, 148, 150, 153, 153, 157, 157, 161, 163, 164, 165, 167, 170, 173, 176, 176, 178, 179, 184, 183, 187, 188, 190, 193, 192, 194, 198, 199, 200, 202, 204, 206, 206, 207, 209, 211, 213, 213, 216, 219, 217, 221, 223, 224, 225, 226, 228, 228, 231, 232, 234, 234, 236, 238];
data2_2MOhm10pF_ch1_2 = (5/1023)*[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 9, 18, 32, 50, 73, 98, 127, 156, 189, 222, 256, 290, 327, 362, 400, 436, 473, 510, 547, 584, 620, 656, 692, 728, 762, 798, 831, 866, 900, 912, 912, 912, 912, 913, 913, 913, 912, 913, 913, 913, 913, 913, 916, 914, 914, 913, 914, 914, 914, 915, 914, 914, 915, 915, 915, 915, 915, 915, 915, 914, 915, 915, 918, 915, 916, 916, 916, 918, 916, 917, 916, 917, 916, 916, 916, 915, 916, 916, 916, 915, 917, 916, 919, 918, 917, 917, 917, 917, 917, 916, 917, 917, 916, 917, 917, 916, 918, 917, 917, 917, 918, 917, 919, 918, 918, 917, 918, 918, 918, 917, 918, 918, 918, 918, 918, 918, 918, 918, 918, 918, 919, 919, 920, 919, 919, 918, 919, 918, 919, 918, 919, 919, 919, 919, 919, 919, 918, 920, 919, 919, 920, 919, 922, 920, 919, 920, 920, 920, 920, 920, 920, 919, 919, 920, 919, 920, 919, 920, 920, 920, 921, 921, 923, 921, 920, 921, 921, 921, 920, 921, 920, 921, 921, 920, 921, 921, 920, 921, 921, 921, 920, 922, 923, 922, 922, 922, 921, 922, 921, 922, 921, 922, 922, 921, 921, 922, 922, 922, 922, 922, 922, 922, 924, 922, 922, 922, 922, 921, 923, 922, 922, 923, 921, 923, 922, 923, 922, 922, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 10, 19, 33, 53, 74, 100, 129, 161, 193, 227, 261, 297, 333, 370, 407, 443, 481, 519, 557, 593, 628, 666, 701, 737, 774, 808, 846, 879, 913, 925, 925, 925, 925, 924, 924, 925, 924, 924, 924, 925, 925, 924, 925, 925, 925, 925, 928, 926, 926, 926, 926, 925, 926, 925, 926, 925, 926, 925, 926, 926, 926, 925, 925, 926, 926, 925, 927, 928, 929, 929, 928, 929, 927, 926, 926, 925, 925, 926, 926, 926, 926, 926, 926, 926, 925, 926, 929, 927, 926, 926, 926, 927, 926, 926, 927, 926, 926, 927, 926, 927, 927, 927, 927, 927, 926, 927];
data2_2MOhm22pF_ch0 = (5/1023)*[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 3, 4, 6, 8, 10, 14, 15, 19, 22, 26, 28, 31, 35, 38, 41, 44, 46, 50, 54, 56, 58, 61, 66, 67, 71, 72, 76, 78, 83, 83, 86, 90, 93, 94, 97, 99, 101, 106, 107, 109, 113, 114, 118, 120, 122, 125, 125, 127, 131, 133, 135, 136, 139, 141, 141, 145, 147, 149, 151, 153, 155, 156, 158, 160, 162, 161, 163, 165, 169, 170, 172, 173, 173, 174, 178, 180, 179, 181, 182, 184, 187, 187, 190, 191, 193, 194, 195, 195, 197, 200, 200, 202, 203, 203, 206, 206, 208, 209, 211, 211, 213, 215, 216, 216, 217, 219, 218, 220, 221, 221, 223, 225, 225, 227, 227, 229, 231, 230, 233, 233, 233, 234, 234, 237, 237, 237, 240, 241, 242, 243, 244, 243, 245, 245, 246, 248, 249, 248, 251, 250, 251, 253, 254, 253, 255, 256, 257, 258, 258, 258, 260, 261, 261, 260, 261, 263, 264, 264, 265, 264, 267, 266, 266, 269, 269, 269, 269, 270, 270, 273, 272, 273, 274, 275, 275, 274, 277, 278, 278, 279, 279, 281, 280, 280, 281, 280, 283, 282, 284, 284, 284, 286, 287, 287, 288, 286, 287, 289, 290, 289, 291, 291, 290, 292, 292, 292, 294, 294, 294, 295, 294, 296, 297, 295, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 3, 7, 8, 11, 13, 17, 20, 22, 25, 30, 32, 35, 39, 42, 45, 48, 50, 53, 56, 60, 63, 66, 68, 71, 75, 77, 81, 82, 86, 89, 92, 95, 96, 98, 102, 105, 107, 109, 112, 114, 116, 119, 119, 123, 126, 128, 128, 130, 135, 135, 139, 139, 143, 144, 146, 149, 149, 151, 153, 157, 157, 160, 162, 162, 164, 165, 168, 169, 172, 172, 176, 175, 179, 178, 180, 182, 185, 186, 188, 189, 190, 193, 192, 193, 196, 198, 197, 201, 200, 202, 204, 204, 207, 208, 209, 209, 212, 211, 213, 214, 215];
data2_2MOhm22pF_ch1 = (5/1023)*[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 8, 17, 30, 48, 70, 95, 123, 152, 183, 217, 250, 286, 321, 357, 393, 430, 466, 501, 538, 575, 611, 645, 682, 717, 752, 785, 819, 854, 887, 904, 906, 907, 906, 907, 907, 906, 906, 907, 906, 906, 907, 906, 907, 907, 907, 907, 907, 907, 907, 907, 906, 907, 907, 907, 907, 907, 906, 906, 907, 906, 907, 907, 908, 907, 908, 908, 908, 908, 907, 908, 908, 908, 908, 908, 908, 908, 908, 908, 908, 908, 908, 909, 910, 908, 908, 908, 909, 908, 908, 909, 908, 908, 909, 909, 909, 908, 909, 909, 908, 908, 909, 908, 910, 910, 910, 908, 910, 909, 909, 909, 908, 909, 909, 909, 910, 910, 908, 910, 909, 909, 910, 910, 911, 910, 910, 910, 910, 910, 910, 909, 910, 910, 909, 909, 910, 910, 910, 910, 910, 909, 909, 910, 911, 911, 911, 911, 910, 911, 911, 910, 911, 911, 910, 911, 911, 911, 911, 911, 910, 910, 910, 910, 913, 912, 911, 912, 911, 912, 912, 911, 911, 911, 911, 912, 911, 912, 912, 912, 912, 912, 911, 912, 913, 913, 913, 912, 912, 913, 913, 911, 912, 912, 913, 912, 912, 913, 913, 913, 913, 913, 913, 913, 915, 914, 913, 913, 913, 913, 913, 914, 914, 913, 913, 914, 913, 913, 914, 914, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 4, 8, 19, 32, 50, 73, 97, 126, 155, 187, 222, 254, 289, 326, 362, 399, 435, 471, 509, 546, 581, 618, 654, 691, 726, 760, 796, 832, 864, 898, 916, 917, 917, 917, 917, 916, 916, 917, 918, 917, 917, 918, 917, 917, 917, 917, 917, 919, 918, 917, 917, 918, 918, 917, 917, 917, 917, 918, 918, 918, 917, 918, 918, 918, 918, 919, 918, 920, 919, 919, 918, 918, 918, 918, 919, 918, 919, 918, 918, 919, 919, 919, 919, 919, 918, 918, 919, 920, 919, 919, 919, 919, 920, 919, 919, 919, 918, 919, 920, 920, 919, 920, 919, 919, 920, 919, 919];
data2_2MOhm47pF_ch0 = (5/1023)*[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 4, 7, 8, 11, 14, 17, 19, 24, 27, 30, 34, 36, 41, 43, 47, 50, 52, 56, 60, 64, 65, 68, 73, 76, 77, 80, 85, 88, 91, 92, 96, 99, 101, 104, 105, 109, 113, 113, 117, 120, 121, 123, 127, 129, 131, 132, 137, 138, 139, 143, 145, 147, 150, 152, 154, 154, 156, 159, 162, 164, 165, 166, 168, 170, 173, 173, 176, 178, 179, 181, 184, 186, 185, 189, 191, 191, 193, 196, 197, 196, 199, 201, 203, 203, 206, 205, 208, 210, 211, 213, 215, 216, 215, 216, 220, 221, 223, 223, 225, 226, 225, 229, 230, 230, 232, 233, 233, 234, 237, 238, 239, 240, 241, 243, 243, 245, 246, 245, 248, 248, 249, 251, 251, 253, 254, 255, 255, 256, 257, 259, 260, 260, 260, 260, 262, 264, 265, 266, 267, 268, 268, 270, 270, 271, 271, 273, 274, 273, 275, 274, 276, 278, 278, 279, 280, 279, 282, 283, 283, 283, 283, 285, 284, 287, 287, 288, 286, 289, 289, 289, 289, 290, 291, 294, 293, 294, 295, 297, 296, 297, 298, 298, 298, 298, 298, 301, 301, 301, 302, 302, 302, 304, 305, 306, 305, 306, 307, 308, 309, 309, 308, 310, 310, 311, 310, 310, 311, 312, 312, 313, 315, 315, 315, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 4, 6, 10, 11, 15, 18, 20, 25, 28, 30, 34, 37, 41, 43, 48, 49, 53, 56, 59, 64, 66, 69, 72, 75, 79, 82, 86, 87, 90, 95, 96, 98, 103, 106, 109, 109, 114, 115, 118, 120, 123, 126, 129, 131, 134, 136, 136, 140, 141, 143, 147, 150, 152, 152, 155, 156, 158, 162, 164, 164, 168, 169, 172, 174, 176, 176, 177, 181, 183, 182, 186, 188, 187, 189, 193, 193, 196, 196, 198, 201, 200, 204, 204, 205, 207, 210, 211, 213, 214, 216, 217, 218, 218, 221, 222, 224, 223, 226, 225, 228, 229];
data2_2MOhm47pF_ch1 = (5/1023)*[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 8, 18, 32, 49, 71, 97, 124, 155, 185, 218, 253, 287, 322, 358, 394, 430, 468, 504, 540, 577, 611, 647, 685, 719, 755, 789, 822, 855, 890, 909, 910, 911, 910, 910, 910, 911, 910, 910, 910, 912, 911, 911, 913, 912, 912, 912, 912, 912, 912, 911, 911, 912, 912, 912, 912, 911, 912, 912, 912, 911, 912, 912, 914, 914, 913, 912, 914, 913, 913, 913, 913, 913, 914, 913, 912, 913, 914, 913, 913, 914, 913, 913, 916, 915, 915, 915, 914, 913, 914, 915, 914, 914, 914, 915, 914, 914, 915, 914, 914, 915, 914, 914, 916, 916, 916, 915, 915, 915, 915, 916, 915, 916, 916, 915, 916, 915, 915, 917, 917, 916, 917, 915, 918, 917, 917, 916, 916, 917, 917, 916, 917, 917, 917, 917, 917, 917, 917, 917, 916, 916, 918, 917, 918, 917, 918, 918, 918, 918, 918, 918, 918, 918, 918, 917, 919, 917, 917, 919, 918, 917, 919, 918, 920, 919, 919, 918, 919, 918, 919, 918, 918, 918, 919, 919, 919, 918, 919, 919, 919, 919, 919, 920, 922, 919, 920, 919, 919, 919, 919, 919, 920, 920, 920, 920, 920, 920, 920, 920, 919, 919, 920, 919, 922, 920, 920, 921, 920, 920, 920, 921, 921, 920, 920, 921, 921, 920, 921, 921, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 9, 18, 31, 50, 72, 98, 127, 157, 189, 222, 257, 292, 328, 365, 402, 438, 476, 512, 549, 585, 622, 658, 694, 730, 765, 800, 837, 870, 904, 926, 923, 924, 924, 923, 924, 923, 924, 924, 923, 923, 923, 923, 923, 924, 923, 924, 925, 924, 925, 925, 924, 925, 925, 925, 923, 924, 924, 924, 924, 925, 925, 925, 925, 924, 925, 924, 927, 925, 925, 925, 925, 924, 924, 924, 924, 925, 924, 925, 925, 925, 925, 925, 925, 924, 924, 925, 926, 926, 925, 926, 925, 926, 925, 925, 926, 925, 925, 925, 926, 925, 926, 926, 926, 926, 925, 925];

figure(1)
subplot(3,2,1);
hold on
plot(i_mA,data100kOhm10pF_ch0(1:256));
plot(i_mA,data100kOhm10pF_ch1(1:256));
legend('channel 0','channel 1');
xlabel('LED Input Current (mA)');
ylabel('Output Voltage (V)');
title('100kOhm');

subplot(3,2,2);
hold on
plot(i_mA,data1MOhm10pF_ch0(1:256));
plot(i_mA,data1MOhm10pF_ch1(1:256));
legend('channel 0','channel 1');
xlabel('LED Input Current (mA)');
ylabel('Output Voltage (V)');
title('1MOhm');

subplot(3,2,3);
hold on
plot(i_mA,data2_2MOhm10pF_ch0(1:256));
plot(i_mA,data2_2MOhm10pF_ch1(1:256));
legend('channel 0','channel 1');
xlabel('LED Input Current (mA)');
ylabel('Output Voltage (V)');
title('2.2MOhm');

subplot(3,2,4);
hold on
plot(i_mA,data47MOhm10pF_ch0(1:256));
plot(i_mA,data47MOhm10pF_ch1(1:256));
legend('channel 0','channel 1');
xlabel('LED Input Current (mA)');
ylabel('Output Voltage (V)');
title('47MOhm');

subplot(3,2,5);
hold on
plot(i_mA,data100MOhm10pF_ch0(1:256));
plot(i_mA,data100MOhm10pF_ch1(1:256));
legend('channel 0','channel 1');
xlabel('LED Input Current (mA)');
ylabel('Output Voltage (V)');
title('100MOhm');

subplot(3,2,6);
hold on
plot(i_mA,data1GOhm10pF_ch0(1:256));
plot(i_mA,data1GOhm10pF_ch1(1:256));
legend('channel 0','channel 1');
xlabel('LED Input Current (mA)');
ylabel('Output Voltage (V)');
title('1GOhm');

figure(2)
title('TIA Capacitor Values Comparison');

subplot(3,1,1);
hold on
plot(i_mA,data2_2MOhm10pF_ch0_2(1:256));
plot(i_mA,data2_2MOhm10pF_ch1_2(1:256));
legend('channel 0','channel 1');
xlabel('LED Input Current (mA)');
ylabel('Output Voltage (V)');
title('10pF');

subplot(3,1,2);
hold on
plot(i_mA,data2_2MOhm22pF_ch0(1:256));
plot(i_mA,data2_2MOhm22pF_ch1(1:256));
legend('channel 0','channel 1');
xlabel('LED Input Current (mA)');
ylabel('Output Voltage (V)');
title('22pF');

subplot(3,1,3);
hold on
plot(i_mA,data2_2MOhm47pF_ch0(1:256));
plot(i_mA,data2_2MOhm47pF_ch1(1:256));
legend('channel 0','channel 1');
xlabel('LED Input Current (mA)');
ylabel('Output Voltage (V)');
title('47pF');