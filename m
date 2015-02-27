From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: [PATCH] getlogin.3: Modify thread-safety information
Date: Fri, 27 Feb 2015 15:21:59 +0800
Message-ID: <54F01B17.6030302@cn.fujitsu.com>
References: <1425017963-10359-1-git-send-email-mashimiao.fnst@cn.fujitsu.com> <54F018E0.8040208@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54F018E0.8040208-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

On 02/27/2015 03:12 PM, Michael Kerrisk (man-pages) wrote:
> Hello Ma Shimiao,
> 
> Applied, but see some notes below.
> 
> On 02/27/2015 07:19 AM, Ma Shimiao wrote:
>> As annotation in glibc manual is more detailed, change the 
>> thread-safety information to be the same as glibc manual.
>>
>> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
>> ---
>>  man3/getlogin.3 | 29 +++++++++++++++++++++++++++--
>>  1 file changed, 27 insertions(+), 2 deletions(-)
>>
>> diff --git a/man3/getlogin.3 b/man3/getlogin.3
>> index 828df2b..241f81c 100644
>> --- a/man3/getlogin.3
>> +++ b/man3/getlogin.3
>> @@ -147,14 +147,39 @@ l l l.
>>  Interface	Attribute	Value
>>  T{
>>  .BR getlogin ()
>> -T}	Thread safety	MT-Unsafe locale
>> +T}	Thread safety	T{
>> +MT-Unsafe race:getlogin race:utent
>> +.br
>> +sig:ALRM timer locale
>> +T}
>>  T{
>>  .BR getlogin_r ()
>> -T}	Thread safety	MT-Safe locale
>> +T}	Thread safety	T{
>> +MT-Unsafe race:utent sig:ALRM timer
>> +.br
>> +locale
>> +T}
>>  T{
>>  .BR cuserid ()
>>  T}	Thread safety	MT-Unsafe race:cuserid/!string locale
>>  .TE
>> +
>> +[[
> 
> The "[[...]]" is not needed.
Got it.
> 
>> +In the above table,
>> +.I utent
>> +in
>> +.I race:utent
>> +signifies that if any of the functions
>> +.BR setutent (), 
>> +.BR getutent (), 
>> +or
>> +.BR endutent ()
>> +are used in parallel in different threads of a program, then data races could occur.
> 
> Where possible, source lines should wrap when more than ~75 characters.

OK, I will take care next time.
> 
>> +.BR getlogin ()
>> +and
>> +.BR getlogin_r ()
>> +call them, so we use race:utent to remind users.
>> +]]
> 
> I removed the [[]] and wrapped the long source. And also made these
> fixes for getpwent.3 and getgrent.3, which I had overlooked earlier.

Thanks a lot!
> 
> Cheers,
> 
> Michael
> 


-- 
Ma Shimiao
Development Dept.I
Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
