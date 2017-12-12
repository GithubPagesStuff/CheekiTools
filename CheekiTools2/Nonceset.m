//
//  Nonceset.m
//  CheekiTools2
//
//  Created by Aiden Bradley Albert on 12/12/17.
//  Copyright (c) 2017 Aiden Bradley Albert. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "v0rtex.h"
#include "common.h"
#include "nvpatch.h"
#include <CoreFoundation/CoreFoundation.h>
#include "Headers/iOkit/IOKitLib.h"
#include <errno.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <sched.h>              // sched_yield
#include <string.h>             // strerror, memset
#include <unistd.h>             // usleep, setuid, getuid
#include <mach/mach.h>
#import "Nonceset.h"
#import "v0rtex.m"

@implementation CustomObject
bool genValid(const char *gentoparse){
    char compareString[22];
    char generatorToSet[22];
    uint64_t rawGeneratorValue;
    switch(strlen(gentoparse))
    {
        case 16:
            sscanf(gentoparse, "%llx", &rawGeneratorValue);
            sprintf(compareString, "%llx", rawGeneratorValue);
            break;
            
        case 18:
            sscanf(gentoparse, "0x%16llx", &rawGeneratorValue);
            sprintf(compareString, "0x%llx", rawGeneratorValue);
            break;
            
        default:
            return false;
            
    }
    if(!strcmp(compareString, gentoparse))
    {
        sprintf(generatorToSet, "0x%llx", rawGeneratorValue);
        if(set_nonce(generatorToSet))
        {
            return true;
        }
    return true;
    } else {
        return false;
    }
}
bool set_nonce(){
    int ret = 0;
    if (run_v0rtex() == true) {
        return true;
    } else {
        return false;
    }}

bool run_v0rtex() {
    task_t tfp0 = MACH_PORT_NULL;
    kptr_t kslide = 0;
    kern_return_t ret = v0rtex(&tfp0, &kslide);
    
    // XXX
    if(ret == KERN_SUCCESS)
    {
        extern kern_return_t mach_vm_read_overwrite(vm_map_t target_task, mach_vm_address_t address, mach_vm_size_t size, mach_vm_address_t data, mach_vm_size_t *outsize);
        uint32_t magic = 0;
        mach_vm_size_t sz = sizeof(magic);
        ret = mach_vm_read_overwrite(tfp0, 0xfffffff007004000 + kslide, sizeof(magic), (mach_vm_address_t)&magic, &sz);
        LOG("mach_vm_read_overwrite: %x, %s", magic, mach_error_string(ret));
        
        FILE *f = fopen("/var/mobile/test.txt", "w");
        LOG("file: %p", f);
        
        return true;
    } else {
        return false;
    }
}


@end
