From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: Fwd: Re: syslog(3) inconsistency
Date: Fri, 24 Mar 2017 18:00:37 +0100
Message-ID: <58D550B5.4020105@bfs.de>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org





Am 24.03.2017 15:40, schrieb Michael Kerrisk (man-pages):
> Hello Ian,
> 
> On 03/23/2017 07:37 PM, Ian Abbott wrote:
>> Hi,
>>
>> The first parameter of `syslog()` is called `priority` in the man-page, 
>> except in the breakdown of the possible log levels, where it is called 
>> `level`.
> 
> Your report doesn't say clearly which pieces of text you find to
> be incorrect, but I wonder if you have missed this sentence in the 
> man page:
> 
>     The priority argument is formed by ORing the facility and the
>     level values (explained below). 
> 
> If you still think there's a problem in the man page, could you please
> describe the problem in more detail.
>


I thing i have an idea what he is talking about. One option
os simply repeating the priority=(facility|level) sentence
as below. Otherwise a simple example would also be helpful.

re,
 wh

--- syslog.3.org	2017-03-24 15:58:02.000000000 +0100
+++ syslog.3	2017-03-24 15:57:10.000000000 +0100
@@ -167,6 +167,15 @@
 .TP
 .B LOG_PID
 Include PID with each message.
+
+.in 3
+The
+.B priority
+argument is formed by ORing the
+.I facility
+and the
+.I level
+values (explained below).
 .SS facility
 The
 .I facility



--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
