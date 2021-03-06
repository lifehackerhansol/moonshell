
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <NDS.h>

#include "_const.h"
#include "maindef.h"
#include "_console.h"
#include "memtool.h"

#include "zlibhelp.h"

#include "zlib/zlib.h"

uLong ZEXPORT compressBound (uLong sourceLen)
{
    return sourceLen + (sourceLen >> 12) + (sourceLen >> 14) + 11;
}

bool zlibcompress(TZLIBData *pZLIBData,u32 LimitSize)
{
  z_stream z;
  
  z.zalloc = Z_NULL;
  z.zfree = Z_NULL;
  z.opaque = Z_NULL;
  
  if(deflateInit2(&z,Z_BEST_COMPRESSION, Z_DEFLATED, 8, 1, Z_DEFAULT_STRATEGY)!=Z_OK){
//  if(deflateInit(&z,Z_BEST_COMPRESSION)!=Z_OK){
    _consolePrintf("zliberror: deflateInit: %s\n", (z.msg) ? z.msg : "???");
    ShowLogHalt();
    while(1);
  }
  
  if(LimitSize==0) LimitSize=compressBound(pZLIBData->SrcSize);
  
  pZLIBData->pDstBuf=(u8*)safemalloc(LimitSize);
  pZLIBData->DstSize=LimitSize;
  
  z.avail_in=pZLIBData->SrcSize;
  z.next_in=pZLIBData->pSrcBuf;
  z.avail_out=pZLIBData->DstSize;
  z.next_out=pZLIBData->pDstBuf;
  
  bool result;
  
  switch(deflate(&z, Z_FINISH)){
    case Z_STREAM_END: {
      pZLIBData->DstSize=z.total_out;
      result=true;
    } break;
    case Z_OK: {
      if(pZLIBData->pDstBuf!=NULL){
        safefree(pZLIBData->pDstBuf); pZLIBData->pDstBuf=NULL;
      }
      pZLIBData->DstSize=0;
      result=false;
    } break;
    default: {
      _consolePrintf("zliberror: deflate: %s\n", (z.msg) ? z.msg : "???");
      ShowLogHalt();
      while(1);
    }
  }
  
/*
  _consolePrintf("ZLIBMEM:pZLIBData->pSrcBuf 0x%x %dbyte.\n",pZLIBData->pSrcBuf,pZLIBData->SrcSize);
  _consolePrintf("ZLIBMEM:pZLIBData->pDstBuf 0x%x %dbyte.\n",pZLIBData->pDstBuf,pZLIBData->DstSize);
  PrintFreeMem();
*/
  
  if(deflateEnd(&z)!=Z_OK){
    _consolePrintf("zliberror: deflateEnd: %s\n", (z.msg) ? z.msg : "???");
    ShowLogHalt();
    while(1);
  }
  
  return(result);
}

bool zlibdecompress(TZLIBData *pZLIBData)
{
  z_stream z;
  z_streamp pz=(z_streamp)&z;
  
  z.zalloc = Z_NULL;
  z.zfree = Z_NULL;
  z.opaque = Z_NULL;
  
  if(inflateInit(pz)!=Z_OK){
    _consolePrintf("zliberror: inflateInit: %s\n", (z.msg) ? z.msg : "???");
    ShowLogHalt();
    while(1);
  }
  
  if((pZLIBData->pDstBuf==NULL)||(pZLIBData->DstSize==0)){
    _consolePrint("zliberror: not allocated deflate memory.\n");
    ShowLogHalt();
    while(1);
  }
  
  z.avail_in=pZLIBData->SrcSize;
  z.next_in=pZLIBData->pSrcBuf;
  z.avail_out=pZLIBData->DstSize;
  z.next_out=pZLIBData->pDstBuf;
  
  bool result;
  
  switch(inflate(pz, Z_FINISH)){
    case Z_STREAM_END: {
      if(pZLIBData->DstSize!=z.total_out){
        _consolePrintf("zliberror: pZLIBData->DstSize(%d)!=z.total_out(%d)\n",pZLIBData->DstSize,z.total_out);
        result=false;
        }else{
        result=true;
      }
    } break;
    case Z_OK: {
      _consolePrint("zliberror: inflate result=Z_OK");
      result=false;
    } break;
    default: {
      _consolePrintf("zliberror: inflate: %s\n", (z.msg) ? z.msg : "???");
      result=false;
    }
  }
  
  if(inflateEnd(pz)!=Z_OK){
    _consolePrintf("zliberror: inflateEnd: %s\n", (z.msg) ? z.msg : "???");
    ShowLogHalt();
    while(1);
  }
  
  return(result);
}
