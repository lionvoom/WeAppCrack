/* @class WAJSCoreService */
-(void)initNativeGlobal {
    r31 = r31 + 0xffffffffffffffa0;
    stack[16] = r26;
    stack[24] = r25;
    stack[32] = r24;
    stack[40] = r23;
    stack[48] = r22;
    stack[56] = r21;
    stack[64] = r20;
    stack[72] = r19;
    stack[80] = r29;
    stack[88] = r30;
    r19 = self;
    objc_sync_enter(@"NativeGlobal");
    r24 = [[NSDictionary dictionary] retain];
    r0 = [r19 context];
    r0 = [r0 retain];
    [r0 setObject:r24 forKeyedSubscript:@"NativeGlobal"];
    [r0 release];
    [r24 release];
    r0 = [r19 context];
    r0 = [r0 retain];
    r20 = [[r0 objectForKeyedSubscript:@"NativeGlobal"] retain];
    [r0 release];
    r22 = [[NSDictionary dictionary] retain];
    r0 = [r19 context];
    r29 = &stack[80];
    r0 = [r0 retain];
    [r0 setObject:r22 forKeyedSubscript:@"WeixinCanvas"];
    [r0 release];
    [r22 release];
    if (([r19 hasRemoreDebugger] & 0x1) == 0x0) {
            r0 = [UIDevice currentDevice];
            r0 = [r0 retain];
            r22 = r0;
            r0 = [r0 systemVersion];
            r0 = [r0 retain];
            [r0 floatValue];
            [r0 release];
            [r22 release];
            r22 = [wxNative alloc];
            r0 = [r19 context];
            r0 = [r0 retain];
            r21 = r0;
            r0 = [r22 initWithJSContext:[r0 JSGlobalContextRef] version:[r20 JSValueRef] parent:r4];
            r22 = sign_extend_64(*(int32_t *)ivar_offset(_wxnative));
            r8 = *(r19 + r22);
            *(r19 + r22) = r0;
            [r8 release];
            [r21 release];
            [*(r19 + r22) setLogDelegate:r19];
            [*(r19 + r22) setReportDelegate:r19];
    }
    [r20 release];
    objc_sync_exit(@"NativeGlobal");
    return;
}


//WeixinJSCore
-(void)injectJSWithCoreData:(void *)arg2 {
    stack[24] = r27;
    r31 = r31 + 0xffffffffffffff90 - 0x1c0;
    r26 = arg2;
    r20 = self;
    stack[176] = [arg2 retain];
    objc_initWeak(&stack[96] - 0x70, r20);
    [[WCKeyReporter externalIMP] logFeatureExtIDkey:0x272 key:0x19 value:0x1 isKeyLog:0x0];
    r0 = [JSContext alloc];
    r0 = [r0 init];
    r8 = *(r20 + 0x38);
    *(r20 + 0x38) = r0;
    [r8 release];
    stack[56] = (&stack[96] - 0x98) + 0x20;
    objc_copyWeak((&stack[96] - 0x98) + 0x20, &stack[96] - 0x70);
    [*(r20 + 0x38) setExceptionHandler:&stack[96] - 0x98];
    r0 = *(r20 + 0x38);
    r0 = [r0 objectForKeyedSubscript:@"WeixinJSCore"];
    r29 = &stack[96];
    r0 = [r0 retain];
    r24 = r0;
    if ([r0 isUndefined] != 0x0) {
            r21 = [[NSDictionary dictionary] retain];
            [*(r20 + 0x38) setObject:r21 forKeyedSubscript:@"WeixinJSCore"];
            [r21 release];
            r0 = *(r20 + 0x38);
            r0 = [r0 objectForKeyedSubscript:@"WeixinJSCore"];
            r29 = r29;
            r19 = [r0 retain];
            [r24 release];
            r24 = r19;
    }
    stack[200] = (r29 - 0xc0) + 0x20;
    objc_copyWeak((r29 - 0xc0) + 0x20, r29 - 0x70);
    r21 = objc_retainBlock(r29 - 0xc0);
    [r24 setValue:r21 forProperty:@"invokeHandler"];
    [r21 release];
    r0 = [NSMutableDictionary alloc];
    r0 = [r0 init];
    r8 = *(r20 + 0x50);
    *(r20 + 0x50) = r0;
    [r8 release];
    stack[192] = (r29 - 0xe8) + 0x20;
    objc_copyWeak((r29 - 0xe8) + 0x20, r29 - 0x70);
    r21 = objc_retainBlock(r29 - 0xe8);
    [r24 setValue:r21 forProperty:@"setTimerHandler"];
    [r21 release];
    stack[184] = &stack[272] + 0x20;
    objc_copyWeak(&stack[272] + 0x20, r29 - 0x70);
    r0 = objc_retainBlock(&stack[272]);
    stack[48] = r24;
    [r24 setValue:r0 forProperty:@"clearTimerHandler"];
    [r0 release];
    r19 = [[MMContext currentContext] retain];
    r0 = [r19 getService:[WAPublicResCacheMgr class]];
    r0 = [r0 retain];
    r24 = [[r0 getPublicForceLocalCacheData:0x4] retain];
    [r0 release];
    [r19 release];
    r0 = [NSString alloc];
    stack[168] = r24;
    r2 = [r0 initWithData:r24 encoding:0x4];
    stack[160] = r2;
    [*(r20 + 0x38) evaluateScript:r2];
    objc_unsafeClaimAutoreleasedReturnValue();
    r0 = [NSBundle mainBundle];
    r0 = [r0 retain];
    r21 = [[r0 URLForResource:@"jsbridge" withExtension:@"js"] retain];
    [r0 release];
    stack[152] = r21;
    r19 = [[NSData dataWithContentsOfURL:r21] retain];
    r0 = @class(NSString);
    r0 = [r0 alloc];
    stack[144] = r19;
    r2 = [r0 initWithData:r19 encoding:0x4];
    stack[136] = r2;
    [*(r20 + 0x38) evaluateScript:r2];
    objc_unsafeClaimAutoreleasedReturnValue();
    [r20 shouldShowJSLog];
    r24 = @class(NSString);
    [r26 scene];
    r23 = [[r24 stringWithFormat:@"var __wxConfig = {platform: 'iOS', widgetType: %u, debug: %u};"] retain];
    r24 = @class(iConsole);
    [r26 coreId];
    [r24 logWithLevel:0x2 module:0x0 errorCode:0x0 file:0x106dfe3ee line:0x15c func:"-[WAMsgNodeJSCore injectJSWithCoreData:]" format:@"coreid=%u, wxConfig={%@}"];
    stack[128] = r23;
    [*(r20 + 0x38) evaluateScript:r23];
    objc_unsafeClaimAutoreleasedReturnValue();
    r23 = [[r20 convertBoolToString:[r26 timerEnabled]] retain];
    r25 = [[r20 convertBoolToString:[r26 drawLock]] retain];
    [r26 drawMinInterVal];
    stack[104] = r25;
    stack[112] = r23;
    r23 = [[NSString stringWithFormat:@"var __widgetConfig__ = {drawMinInterval: %u, timerEnabled: %@, drawLock: %@};"] retain];
    r19 = @class(iConsole);
    [r26 coreId];
    stack[16] = r23;
    [r19 logWithLevel:0x2 module:0x0 errorCode:0x0 file:0x106dfe3ee line:0x163 func:"-[WAMsgNodeJSCore injectJSWithCoreData:]" format:@"coreid=%u, widgetConfig={%@}"];
    stack[96] = r23;
    [*(r20 + 0x38) evaluateScript:r23];
    objc_unsafeClaimAutoreleasedReturnValue();
    [r20 tryLogAction:0xc];
    r0 = [WAApptaskPublicResLogic alloc];
    r0 = [r0 init];
    [r0 setAppid:@"WeAppID_dynamicPage"];
    stack[88] = r0;
    r19 = [[r0 getPublicLocalCacheData:0x6] retain];
    r0 = [NSString alloc];
    stack[80] = r19;
    r2 = [r0 initWithData:r19 encoding:0x4];
    stack[72] = r2;
    [*(r20 + 0x38) evaluateScript:r2];
    objc_unsafeClaimAutoreleasedReturnValue();
    [r20 tryLogAction:0xd];
    [objc_msgSend(@class(MMContext), @selector(currentContext)) retain];
    objc_msgSend(@class(WAMsgNodeResourceMgr), @selector(class));
    r24 = [objc_msgSend(r25, @selector(getService:)) retain];
    r22 = [[*(r20 + 0x28) appId] retain];
    r28 = [*(r20 + 0x28) version];
    r23 = [*(r20 + 0x28) debugMode];
    r19 = @selector(scene);
    r26 = objc_msgSend(r26, @selector(scene));
    [stack[176] release];
    r0 = [r24 getScriptWithAppId:r22 version:r28 debugMode:r23 scene:r26];
    r29 = r29;
    r26 = [r0 retain];
    [r22 release];
    [r24 release];
    [r25 release];
    if (objc_msgSend(r26, @selector(length)) != 0x0) {
            objc_msgSend(*(r20 + 0x38), @selector(evaluateScript:));
            r29 = r29;
            objc_unsafeClaimAutoreleasedReturnValue();
            [r20 tryLogAction:0xe];
            r27 = stack[48];
            r23 = stack[56];
    }
    else {
            r24 = @selector(class);
            r25 = @selector(currentContext);
            r0 = objc_msgSend(r20, @selector(coreData));
            r29 = r29;
            r0 = [r0 retain];
            r23 = objc_msgSend(r0, r19);
            [r0 release];
            COND = r23 != 0x1;
            r27 = stack[48];
            r23 = stack[56];
            if (!COND) {
                    [objc_msgSend(@class(MMContext), r25) retain];
                    objc_msgSend(@class(WAMsgNodeActionReportMgr), r24);
                    r24 = r19;
                    r25 = [objc_msgSend(r19, @selector(getService:)) retain];
                    r0 = objc_msgSend(r20, @selector(coreData));
                    r0 = [r0 retain];
                    r22 = r0;
                    r19 = [objc_msgSend(r0, @selector(appId)) retain];
                    r0 = objc_msgSend(r20, @selector(coreData));
                    r29 = r29;
                    r0 = [r0 retain];
                    [r25 logAlarmReportForCore:r19 coreId:objc_msgSend(r0, @selector(coreId)) key:0x83c];
                    [r0 release];
                    [r19 release];
                    [r22 release];
                    [r25 release];
                    [r24 release];
            }
    }
    *(r20 + 0x18) = 0x1;
    [r20 setHasInjected:0x1];
    objc_msgSend(@class(iConsole), @selector(logWithLevel:module:errorCode:file:line:func:format:));
    dispatch_sync(*__dispatch_main_q, &stack[232]);
    [r26 release];
    [stack[72] release];
    [stack[80] release];
    [stack[88] release];
    [stack[96] release];
    [stack[104] release];
    [stack[112] release];
    [stack[128] release];
    [stack[136] release];
    [stack[144] release];
    [stack[152] release];
    [stack[160] release];
    [stack[168] release];
    objc_destroyWeak(stack[184]);
    objc_destroyWeak(stack[192]);
    objc_destroyWeak(stack[200]);
    [r27 release];
    objc_destroyWeak(r23);
    objc_destroyWeak(r29 - 0x70);
    return;
}

/* @class WAJSCoreService */
-(void)setupSystemLog:(void *)arg2 {
    r31 = r31 + 0xffffffffffffffd0;
    stack[16] = r20;
    stack[24] = r19;
    stack[32] = r29;
    stack[40] = r30;
    r0 = [arg2 retain];
    r19 = r0;
    r0 = [r0 objectForKeyedSubscript:@"systemLog"];
    r0 = [r0 retain];
    r21 = [r0 isUndefined];
    [r0 release];
    if (r21 != 0x0) {
            r20 = objc_retainBlock(0x107e43518);
            [r19 setObject:r20 forKeyedSubscript:@"systemLog"];
            [r20 release];
    }
    [r19 release];
    return;
}

/* @class WAJSNativeBufferBase */
-(void)injectWeiXinNativeBuffer:(void *)arg2 isShared:(bool)arg3 workerId:(unsigned int)arg4 {
    r31 = r31 - 0x150;
    var_60 = d9;
    stack[-104] = d8;
    var_50 = r28;
    stack[-88] = r27;
    var_40 = r26;
    stack[-72] = r25;
    var_30 = r24;
    stack[-56] = r23;
    var_20 = r22;
    stack[-40] = r21;
    var_10 = r20;
    stack[-24] = r19;
    saved_fp = r29;
    stack[-8] = r30;
    r29 = &saved_fp;
    r22 = arg4;
    r23 = arg3;
    r28 = self;
    r19 = [arg2 retain];
    r0 = [r28 useBase64gEncodingDataProtocol];
    if ((r0 & 0x1) != 0x0) goto loc_1058b98cc;

loc_1058b95ac:
    if (r23 != 0x0) {
            if (!CPU_FLAGS & NE) {
                    r0 = @"WeixinNativeBuffer";
            }
            else {
                    r0 = @"SharedBufferCore";
            }
    }
    r20 = [r0 retain];
    r0 = [r19 objectForKeyedSubscript:r20];
    r29 = r29;
    r0 = [r0 retain];
    r24 = r0;
    if (objc_msgSend(r0, @selector(isUndefined)) != 0x0) {
            r21 = [[NSDictionary dictionary] retain];
            [r19 setObject:r21 forKeyedSubscript:r20];
            [r21 release];
            r0 = [r19 objectForKeyedSubscript:r20];
            r29 = r29;
            r21 = [r0 retain];
            [r24 release];
            r24 = r21;
    }
    r0 = objc_msgSend(r24, @selector(valueForProperty:));
    r29 = r29;
    r0 = [r0 retain];
    r26 = r0;
    if (objc_msgSend(r0, @selector(isUndefined)) != 0x0) goto loc_1058b96d4;

loc_1058b96a0:
    r0 = objc_msgSend(r24, @selector(valueForProperty:));
    r29 = r29;
    r0 = [r0 retain];
    r21 = r0;
    if (objc_msgSend(r0, @selector(isUndefined)) == 0x0) goto loc_1058b98f8;

loc_1058b96cc:
    [r21 release];
    goto loc_1058b96d4;

loc_1058b96d4:
    [r26 release];
    var_12C = r22;
    var_128 = r20;
    objc_initWeak(r29 - 0x70, r28);
    r25 = &var_A0 + 0x20;
    var_138 = r28;
    objc_copyWeak(r25, r29 - 0x70);
    r0 = objc_retainBlock(&var_A0);
    [r24 setValue:r0 forProperty:@"new"];
    [r0 release];
    r26 = &var_D0 + 0x20;
    objc_copyWeak(r26, r29 - 0x70);
    r0 = objc_retainBlock(&var_D0);
    [r24 setValue:r0 forProperty:@"get"];
    [r0 release];
    r28 = &var_F8 + 0x20;
    objc_copyWeak(r28, r29 - 0x70);
    r0 = objc_retainBlock(&var_F8);
    [r24 setValue:r0 forProperty:@"destroy"];
    [r0 release];
    r21 = &var_120 + 0x20;
    objc_copyWeak(r21, r29 - 0x70);
    r0 = objc_retainBlock(&var_120);
    [r24 setValue:r0 forProperty:@"useCompatibleMode"];
    [r0 release];
    if (r23 != 0x0) {
            [var_138 setupSharedBufferExtention:r24 workerId:var_12C];
    }
    objc_destroyWeak(r21);
    objc_destroyWeak(r28);
    objc_destroyWeak(r26);
    objc_destroyWeak(r25);
    objc_destroyWeak(r29 - 0x70);
    r20 = var_128;
    goto loc_1058b98bc;

loc_1058b98bc:
    [r24 release];
    [r20 release];
    goto loc_1058b98cc;

loc_1058b98cc:
    [r19 release];
    return;

loc_1058b98f8:
    r0 = objc_msgSend(r24, @selector(valueForProperty:));
    r29 = r29;
    r0 = [r0 retain];
    r25 = objc_msgSend(r0, @selector(isUndefined));
    [r0 release];
    [r21 release];
    [r26 release];
    if (r25 != 0x0) {
            var_12C = r22;
            var_128 = r20;
            objc_initWeak(r29 - 0x70, r28);
            r25 = &var_A0 + 0x20;
            var_138 = r28;
            objc_copyWeak(r25, r29 - 0x70);
            r0 = objc_retainBlock(&var_A0);
            [r24 setValue:r0 forProperty:@"new"];
            [r0 release];
            r26 = &var_D0 + 0x20;
            objc_copyWeak(r26, r29 - 0x70);
            r0 = objc_retainBlock(&var_D0);
            [r24 setValue:r0 forProperty:@"get"];
            [r0 release];
            r28 = &var_F8 + 0x20;
            objc_copyWeak(r28, r29 - 0x70);
            r0 = objc_retainBlock(&var_F8);
            [r24 setValue:r0 forProperty:@"destroy"];
            [r0 release];
            r21 = &var_120 + 0x20;
            objc_copyWeak(r21, r29 - 0x70);
            r0 = objc_retainBlock(&var_120);
            [r24 setValue:r0 forProperty:@"useCompatibleMode"];
            [r0 release];
            if (r23 != 0x0) {
                    [var_138 setupSharedBufferExtention:r24 workerId:var_12C];
            }
            objc_destroyWeak(r21);
            objc_destroyWeak(r28);
            objc_destroyWeak(r26);
            objc_destroyWeak(r25);
            objc_destroyWeak(r29 - 0x70);
            r20 = var_128;
    }
    goto loc_1058b98bc;
}

/* @class WAJSNativeBufferBase */
-(void)injectWeiXinArrayBuffer:(void *)arg2 {
    r31 = r31 - 0xe0;
    var_50 = d9;
    stack[-88] = d8;
    var_40 = r26;
    stack[-72] = r25;
    var_30 = r24;
    stack[-56] = r23;
    var_20 = r22;
    stack[-40] = r21;
    var_10 = r20;
    stack[-24] = r19;
    saved_fp = r29;
    stack[-8] = r30;
    r29 = &saved_fp;
    r21 = self;
    r19 = [arg2 retain];
    if (([r21 useBase64gEncodingDataProtocol] & 0x1) == 0x0) {
            r0 = [r19 objectForKeyedSubscript:@"WeixinArrayBuffer"];
            r29 = r29;
            r0 = [r0 retain];
            r20 = r0;
            if ([r0 isUndefined] != 0x0) {
                    r23 = [[NSDictionary dictionary] retain];
                    [r19 setObject:r23 forKeyedSubscript:@"WeixinArrayBuffer"];
                    [r23 release];
                    r0 = [r19 objectForKeyedSubscript:@"WeixinArrayBuffer"];
                    r29 = r29;
                    r22 = [r0 retain];
                    [r20 release];
                    r20 = r22;
            }
            objc_initWeak(r29 - 0x58, r21);
            objc_copyWeak(&var_80 + 0x20, r29 - 0x58);
            r0 = objc_retainBlock(&var_80);
            [r20 setValue:r0 forProperty:@"create"];
            [r0 release];
            objc_copyWeak(&var_A8 + 0x20, r29 - 0x58);
            r0 = objc_retainBlock(&var_A8);
            [r20 setValue:r0 forProperty:@"destroy"];
            [r0 release];
            objc_copyWeak(&var_D0 + 0x20, r29 - 0x58);
            r0 = objc_retainBlock(&var_D0);
            [r20 setValue:r0 forProperty:@"get"];
            [r0 release];
            objc_destroyWeak(&var_D0 + 0x20);
            objc_destroyWeak(&var_A8 + 0x20);
            objc_destroyWeak(&var_80 + 0x20);
            objc_destroyWeak(r29 - 0x58);
            [r20 release];
    }
    [r19 release];
    return;
}

/* @class WAJSCoreService */
-(void)setupSubContext:(bool)arg2 {
    r31 = r31 - 0x150;
    var_60 = d9;
    stack[-104] = d8;
    var_50 = r28;
    stack[-88] = r27;
    var_40 = r26;
    stack[-72] = r25;
    var_30 = r24;
    stack[-56] = r23;
    var_20 = r22;
    stack[-40] = r21;
    var_10 = r20;
    stack[-24] = r19;
    saved_fp = r29;
    stack[-8] = r30;
    r20 = arg2;
    r21 = self;
    r0 = [self context];
    r0 = [r0 retain];
    r24 = r0;
    r0 = [r0 objectForKeyedSubscript:@"WeixinJSContext"];
    r29 = &saved_fp;
    r19 = [r0 retain];
    [r24 release];
    if ([r19 isUndefined] != 0x0) {
            r24 = [[NSDictionary dictionary] retain];
            r0 = [r21 context];
            r0 = [r0 retain];
            [r0 setObject:r24 forKeyedSubscript:@"WeixinJSContext"];
            [r0 release];
            [r24 release];
            r0 = [r21 context];
            r0 = [r0 retain];
            r22 = r0;
            r0 = [r0 objectForKeyedSubscript:@"WeixinJSContext"];
            r29 = r29;
            r23 = [r0 retain];
            [r19 release];
            [r22 release];
            r19 = r23;
    }
    objc_initWeak(r29 - 0x68, r21);
    objc_copyWeak((r29 - 0x98) + 0x20, r29 - 0x68);
    r22 = objc_retainBlock(r29 - 0x98);
    [r19 setValue:r22 forProperty:@"create"];
    [r22 release];
    objc_copyWeak(&var_C8 + 0x20, r29 - 0x68);
    r0 = objc_retainBlock(&var_C8);
    [r19 setValue:r0 forProperty:@"alloc"];
    [r0 release];
    objc_copyWeak(&var_F0 + 0x20, r29 - 0x68);
    r0 = objc_retainBlock(&var_F0);
    [r19 setValue:r0 forProperty:@"destroy"];
    [r0 release];
    objc_copyWeak(&var_118 + 0x20, r29 - 0x68);
    r0 = objc_retainBlock(&var_118);
    [r19 setValue:r0 forProperty:@"evaluateScriptFile"];
    [r0 release];
    objc_copyWeak(&var_140 + 0x20, r29 - 0x68);
    r0 = objc_retainBlock(&var_140);
    [r19 setValue:r0 forProperty:@"loadJsFiles"];
    [r0 release];
    objc_destroyWeak(&var_140 + 0x20);
    objc_destroyWeak(&var_118 + 0x20);
    objc_destroyWeak(&var_F0 + 0x20);
    objc_destroyWeak(&var_C8 + 0x20);
    objc_destroyWeak((r29 - 0x98) + 0x20);
    objc_destroyWeak(r29 - 0x68);
    [r19 release];
    return;
}

/* @class WAJSCoreService */
-(void)setupWeixinWorker {
    r31 = r31 - 0xe0;
    var_50 = d9;
    stack[-88] = d8;
    var_40 = r26;
    stack[-72] = r25;
    var_30 = r24;
    stack[-56] = r23;
    var_20 = r22;
    stack[-40] = r21;
    var_10 = r20;
    stack[-24] = r19;
    saved_fp = r29;
    stack[-8] = r30;
    r20 = self;
    r0 = [self context];
    r0 = [r0 retain];
    r23 = r0;
    r0 = [r0 objectForKeyedSubscript:@"WeixinWorker"];
    r29 = &saved_fp;
    r19 = [r0 retain];
    [r23 release];
    if ([r19 isUndefined] != 0x0) {
            r23 = [[NSDictionary dictionary] retain];
            r0 = [r20 context];
            r0 = [r0 retain];
            [r0 setObject:r23 forKeyedSubscript:@"WeixinWorker"];
            [r0 release];
            [r23 release];
            r0 = [r20 context];
            r0 = [r0 retain];
            r21 = r0;
            r0 = [r0 objectForKeyedSubscript:@"WeixinWorker"];
            r29 = r29;
            r22 = [r0 retain];
            [r19 release];
            [r21 release];
            r19 = r22;
    }
    objc_initWeak(r29 - 0x58, r20);
    objc_copyWeak(&var_80 + 0x20, r29 - 0x58);
    r0 = objc_retainBlock(&var_80);
    [r19 setValue:r0 forProperty:@"create"];
    [r0 release];
    objc_copyWeak(&var_A8 + 0x20, r29 - 0x58);
    r0 = objc_retainBlock(&var_A8);
    [r19 setValue:r0 forProperty:@"postMsgToWorker"];
    [r0 release];
    objc_copyWeak(&var_D0 + 0x20, r29 - 0x58);
    r0 = objc_retainBlock(&var_D0);
    [r19 setValue:r0 forProperty:@"terminate"];
    [r0 release];
    objc_destroyWeak(&var_D0 + 0x20);
    objc_destroyWeak(&var_A8 + 0x20);
    objc_destroyWeak(&var_80 + 0x20);
    objc_destroyWeak(r29 - 0x58);
    [r19 release];
    return;
}

/* @class WAJSCoreService */
-(void)setupWeAppWorker {
    r31 = r31 - 0xe0;
    var_50 = d9;
    stack[-88] = d8;
    var_40 = r26;
    stack[-72] = r25;
    var_30 = r24;
    stack[-56] = r23;
    var_20 = r22;
    stack[-40] = r21;
    var_10 = r20;
    stack[-24] = r19;
    saved_fp = r29;
    stack[-8] = r30;
    r20 = self;
    r0 = [self context];
    r0 = [r0 retain];
    r23 = r0;
    r0 = [r0 objectForKeyedSubscript:@"WeAppWorker"];
    r29 = &saved_fp;
    r19 = [r0 retain];
    [r23 release];
    if ([r19 isUndefined] != 0x0) {
            r23 = [[NSDictionary dictionary] retain];
            r0 = [r20 context];
            r0 = [r0 retain];
            [r0 setObject:r23 forKeyedSubscript:@"WeAppWorker"];
            [r0 release];
            [r23 release];
            r0 = [r20 context];
            r0 = [r0 retain];
            r21 = r0;
            r0 = [r0 objectForKeyedSubscript:@"WeAppWorker"];
            r29 = r29;
            r22 = [r0 retain];
            [r19 release];
            [r21 release];
            r19 = r22;
    }
    objc_initWeak(r29 - 0x58, r20);
    objc_copyWeak(&var_80 + 0x20, r29 - 0x58);
    r0 = objc_retainBlock(&var_80);
    [r19 setValue:r0 forProperty:@"create"];
    [r0 release];
    objc_copyWeak(&var_A8 + 0x20, r29 - 0x58);
    r0 = objc_retainBlock(&var_A8);
    [r19 setValue:r0 forProperty:@"postMsgToWorker"];
    [r0 release];
    objc_copyWeak(&var_D0 + 0x20, r29 - 0x58);
    r0 = objc_retainBlock(&var_D0);
    [r19 setValue:r0 forProperty:@"terminate"];
    [r0 release];
    objc_destroyWeak(&var_D0 + 0x20);
    objc_destroyWeak(&var_A8 + 0x20);
    objc_destroyWeak(&var_80 + 0x20);
    objc_destroyWeak(r29 - 0x58);
    [r19 release];
    return;
}
