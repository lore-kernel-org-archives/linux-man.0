From: Mats Wichmann <mats-mBRmNHn34rVzbRFIqnYvSA@public.gmane.org>
Subject: Re: dlopen man page example fails for x86_64 (release 4.12), OK for
 32-bit target
Date: Wed, 23 Aug 2017 08:57:30 -0600
Message-ID: <4c37a76b-1995-2dfe-6d80-802c08aedad3@wichmann.us>
References: <c6443ac5-b115-e53f-1a5e-cd3568263f32@suddenlinkmail.com>
 <CAKgNAkid9StEr3LGhZ6xWMxMKKu+8E_a8n37vLPOUsFq=hv2yw@mail.gmail.com>
 <4aba2028-8b1a-535b-4762-3464ace8276c@wichmann.us>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4aba2028-8b1a-535b-4762-3464ace8276c-mBRmNHn34rVzbRFIqnYvSA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "David C. Rankin" <drankinatty-hPWwJ4didUaz5mO2DORSKdBPR1lH4CV8@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 08/23/2017 08:11 AM, Mats Wichmann wrote:
> On 08/22/2017 05:11 PM, Michael Kerrisk (man-pages) wrote:
>> David,
>>
>> On 22 August 2017 at 04:53, David C. Rankin
>> <drankinatty-hPWwJ4didUaz5mO2DORSKdBPR1lH4CV8@public.gmane.org> wrote:
>>> All,
>>>
>>>   The man 3 dlopen example needs updating to run on x86_64. It will run fine
>>> as a 32-bit compile (with -m32), but fails without it, e.g.
>>>
>>> $ gcc -Wall -Wextra -pedantic -Wshadow -std=gnu11 -Ofast -ldl -o
>>> bin/dlopen_man_ex dlopen_man_ex.c
>>>
>>> $ ./bin/dlopen_man_ex
>>> /usr/lib/libm.so: invalid ELF header
> 
> This sounds like you're picking up the linker script, which is not an
> ELF file, but rather link-time instructions - you can't dlopen that.  If
> the "magic" in /usr/include/gnu is working, you should be getting an
> soname line "libc.so.6" plugged in, not "libc.so".

of course, libm rather than libc.  sigh.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
