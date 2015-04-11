From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: "man 3 vsprintf" : simple bug in EXAMPLE section
Date: Sat, 11 Apr 2015 09:30:29 +0200
Message-ID: <5528CD95.7010204@gmail.com>
References: <551584DE020000D400069A4C@relay2.provo.novell.com> <CAKgNAkjY=YpuZ7ifA1HCN68jZZ_PgFRw4KYfKaXeViPAvs+m+w@mail.gmail.com> <5515C2F9020000D400069A6F@relay2.provo.novell.com> <55152F0A.7090708@bfs.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55152F0A.7090708-fPG8STNUNVg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wharms-fPG8STNUNVg@public.gmane.org, Zhen Ren <zren-IBi9RG/b67k@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 03/27/2015 11:20 AM, walter harms wrote:
> 
> hi Zhen Ren,
> i tried to create a more simple example. Do you think this is more
> helpful for you ?

Walter,

Your version seems better. See comments below.

> re,
>  wh
> 
> char *
> make_message2 (const char *fmt, ...)
> {
>   int n,size = 0;
>   char *p = NULL;
>   va_list ap;
> 
>   /* figure our required size */

>   va_start (ap, fmt);
>   size = vsnprintf (p, size, fmt, ap);
>   va_end (ap);
> 
>   if (size < 0)
>     return NULL;
> 
>   /* leave room for \0 */
>   size++;
>   p = malloc (size);
>   if (p == NULL)
>     return NULL;
> 
>   va_start (ap, fmt);
>   n = vsnprintf (p, size, fmt, ap);

What's missing here is a check on the return value from
the vsnprintf() call. I added one.

I've put your code into the page, replacing the existing
example, with the fix noted above.

Thanks,

Michael



>   va_end (ap);
> 
> return p;
> }

> Am 27.03.2015 10:52, schrieb Zhen Ren:
>> Hi Michael,
>>
>> I'm so sorry for this negative report.
>>
>> Yeah, you're right. It'll fall through,loop again,do "vsprintf" and return if done.
>>
>> --
>> Best regards,
>> Eric, Ren
>> HA team, SUSE
>>
>>
>>>>>
>>> Hello Zhen Ren, 
>>>  
>>> On 27 March 2015 at 06:27, Zhen Ren <zren-IBi9RG/b67k@public.gmane.org> wrote: 
>>>> Hi, 
>>>> There is simple bug in EXAMPLE section of "man 3 vsprintf". 
>>>>
>>>> Function will return nothing if  it steps into the last "else {}". 
>>>>
>>>> ------------------ example code ----------------- 
>>>>  char * 
>>>>        make_message(const char *fmt, ...) 
>>>>        { 
>>>>            int n; 
>>>>            int size = 100;     /* Guess we need no more than 100 bytes */ 
>>>>            char *p, *np; 
>>>>            va_list ap; 
>>>> . 
>>>> .cut off 
>>>> . 
>>>>                np = realloc(p, size); 
>>>>                if (np == NULL) { 
>>>>                    free(p); 
>>>>                    return NULL; 
>>>>                } else { 
>>>>                    p = np; 
>>>> +                return p; 
>>>>                } 
>>>>            } 
>>>>        } 
>>>  
>>> I have not looked too closely at the code, but the above report 
>>> appears incorrect to me. The function should NOT be returning at that 
>>> point. It should be falling through and then round the loop once more. 
>>> If I've missed something, could you elaborate a little more on the 
>>> problem, please? 
>>>  
>>> Cheers, 
>>>  
>>> Michael 
>>>  
>>>  
>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-man" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
