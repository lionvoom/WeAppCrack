/* How to Hook with Logos
Hooks are written with syntax similar to that of an Objective-C @implementation.
You don't need to #include <substrate.h>, it will be done automatically, as will
the generation of a class list and an automatic constructor.

%hook ClassName

// Hooking a class method
+ (id)sharedInstance {
	return %orig;
}

// Hooking an instance method with an argument.
- (void)messageName:(int)argument {
	%log; // Write a message about this call, including its class, name and arguments, to the system log.

	%orig; // Call through to the original function with its original arguments.
	%orig(nil); // Call through to the original function with a custom argument.

	// If you use %orig(), you MUST supply all arguments (except for self and _cmd, the automatically generated ones.)
}

// Hooking an instance method with no arguments.
- (id)noArguments {
	%log;
	id awesome = %orig;
	[awesome doSomethingElse];

	return awesome;
}

// Always make sure you clean up after yourself; Not doing so could have grave consequences!
%end
*/


// @class JSContext;
// @class WKWebView;
@class WAAppTask;
@class WAWebViewController;
@class JSValue;

@interface WAWebViewController : UIViewController
@end

@interface MYHOOKCLASS : NSObject
- (void)evaluateJavaScript:(NSString *)javaScriptString completionHandler:(void (^)( id, NSError * error))completionHandler;
@end


NSString *LFHOOKLOGTIME(void) {
	static const NSDateFormatter *formatter;
    if (!formatter) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS Z"];
    }
    NSString *str = [formatter stringFromDate:NSDate.date];
    return str;
}

#import "src/LFHookUtil.h"


%hook JSValue
- (id)valueForProperty:(id)property {
	id context = [(NSObject*)self valueForKey:@"context"];
	NSString *msg = [NSString stringWithFormat:@"[%@] JSValue(%@-%p)-valueForProperty:%@\n", LFHOOKLOGTIME(), self, self, property];
	NSString *fileName = [NSString stringWithFormat:@"jshook_JSContext_KeyedSubscript_%p.txt", context];
	[LFHookUtil writeTxt:msg toFile:fileName];
	return %orig;
}

- (void)setValue:(id)value forProperty:(id)property {
	id context = [(NSObject*)self valueForKey:@"context"];
	NSString *msg = [NSString stringWithFormat:@"[%@] JSValue(%@-%p)-setValue:forProperty:%@,%@\n", LFHOOKLOGTIME(), self, self, value, property];
	NSString *fileName = [NSString stringWithFormat:@"jshook_JSContext_KeyedSubscript_%p.txt", context];
	[LFHookUtil writeTxt:msg toFile:fileName];
	%orig;
}

- (BOOL)deleteProperty:(id)property {
	id context = [(NSObject*)self valueForKey:@"context"];
	NSString *msg = [NSString stringWithFormat:@"[%@] JSValue(%@-%p)-deleteProperty:%@\n", LFHOOKLOGTIME(), self, self, property];
	NSString *fileName = [NSString stringWithFormat:@"jshook_JSContext_KeyedSubscript_%p.txt", context];
	[LFHookUtil writeTxt:msg toFile:fileName];
	return %orig;
}
%end


%hook JSContext
// - (id)evaluateScript:(NSString *)script {
// 	NSString *msg = [NSString stringWithFormat:@"%@\n", script];
// 	NSString *fileName = [NSString stringWithFormat:@"jshook_service_%p.txt", self];
// 	[LFHookUtil writeTxt:msg toFile:fileName];
// 	return %orig;
// }

- (id)evaluateScript:(NSString *)script withSourceURL:(NSURL *)sourceURL {
	NSString *msg = [NSString stringWithFormat:@"[%@] %@\nsourceURL:%@\n", LFHOOKLOGTIME(), script, sourceURL.path];
	NSString *fileName = [NSString stringWithFormat:@"jshook_service_%p.txt", self];
	[LFHookUtil writeTxt:msg toFile:fileName];
	return %orig;
}

- (id)objectForKeyedSubscript:(id)key {
	NSString *msg = [NSString stringWithFormat:@"[%@] objectForKeyedSubscript:%@\n", LFHOOKLOGTIME(), key];
	NSString *fileName = [NSString stringWithFormat:@"jshook_JSContext_KeyedSubscript_%p.txt", self];
	[LFHookUtil writeTxt:msg toFile:fileName];
	return %orig;
}

- (void)setObject:(id)object forKeyedSubscript:(id)key {
	// NSString *msg = [NSString stringWithFormat:@"[%@] setObject:forKeyedSubscript:%@,%@\n", LFHOOKLOGTIME(), object, key];
	NSString *msg = [NSString stringWithFormat:@"[%@] setObject:forKeyedSubscript:%@\n", LFHOOKLOGTIME(), key];
	NSString *fileName = [NSString stringWithFormat:@"jshook_JSContext_KeyedSubscript_%p.txt", self];
	[LFHookUtil writeTxt:msg toFile:fileName];
	%orig;
}

%end

%hook WKWebView
// - (id)loadFileURL:(NSURL *)URL allowingReadAccessToURL:(NSURL *)readAccessURL {
// 	NSString *msg = [NSString stringWithFormat:@"%s,URL:%@,readAccessURL:%@\n", __func__, URL.path, readAccessURL.path];	
// 	[LFHookUtil writeTxt:msg toFile:@"jshook_loadFileURL.txt"];
// 	return %orig;
// }

- (id)loadHTMLString:(NSString *)string baseURL:(NSURL *)baseURL {
	NSString *msg = [NSString stringWithFormat:@"[%@] %s,string:%@,baseURL:%@\n", LFHOOKLOGTIME(), __func__, string, baseURL.path];
	NSString *fileName = [NSString stringWithFormat:@"jshook_loadHTMLString_%p.txt", self];
	[LFHookUtil writeTxt:msg toFile:fileName];
	return %orig;
}

- (void)evaluateJavaScript:(NSString *)javaScriptString completionHandler:(id)completionHandler {
	NSString *msg = [NSString stringWithFormat:@"[%@] %@\n", LFHOOKLOGTIME(), javaScriptString];
	NSString *fileName = [NSString stringWithFormat:@"jshook_webview_%p.txt", self];
	[LFHookUtil writeTxt:msg toFile:fileName];
	%orig;
}

- (void)customUserAgent:(NSString *)ua {
	NSString *msg = [NSString stringWithFormat:@"%@\n", ua];
	[LFHookUtil writeTxt:msg toFile:@"jshook_customUserAgent.txt"];
	%orig;
}
%end



%hook WAWebViewController
- (id)initWithBaseURL:(id)arg1 pageRelativeURL:(id)arg2 extraInfo:(id)arg3 delegate:(id)arg4 {
	NSString *msg = [NSString stringWithFormat:@"initWithBaseURL:%@, pageRelativeURL:%@, extraInfo:%@\n", arg1, arg2, arg3];
	NSString *fileName = [NSString stringWithFormat:@"WAWebViewController_%p.txt", self];
	[LFHookUtil writeTxt:msg toFile:fileName];
	return %orig;
}
%end

%hook WAAppTask
- (void)setupAppServiceAndWebViewWithAppID:(id)arg1 contact:(id)arg2 packageConfig:(id)arg3 baseURL:(id)arg4 pageRelativeURL:(id)arg5 getWebView:(id *)arg6 shouldUseComponentLazyLoad:(_Bool)arg7 {
	NSString *msg = [NSString stringWithFormat:@"AppID:%@, contact:%@, packageConfig:%@, baseURL:%@, pageRelativeURL:%@\n", arg1, arg2, arg3, arg4, arg5];
	NSString *fileName = [NSString stringWithFormat:@"WAAppTask_%p.txt", self];
	[LFHookUtil writeTxt:msg toFile:fileName];
	%orig;
}
%end
