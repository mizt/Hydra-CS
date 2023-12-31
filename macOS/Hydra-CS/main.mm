#import <Foundation/Foundation.h>
#import <Metal/Metal.h>

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#define STB_IMAGE_WRITE_IMPLEMENTATION
#define STBI_ONLY_PNG
namespace stb_image {
    #import "stb_image_write.h"
}
#pragma clang diagnostic pop

#import <vector>

#import "FileManager.h"
#import "MTLUtils.h"
#import "MTLReadPixels.h"
#import "PixelBuffer.h"
#import "ComputeShaderBase.h"
#import "HydraComputeShader.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int w = 1920<<1;
        int h = 1080<<1;
         
        HydraComputeShader *hydra = new HydraComputeShader(w,h,@"../../hydra.json");
        stb_image::stbi_write_png("test.png",w,h,4,(void const *)hydra->exec(),w<<2);
        
        delete hydra;
    }
    return 0;
}
