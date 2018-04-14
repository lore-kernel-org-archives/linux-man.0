From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH 2/2] crypt.3, encrypt.3: Add notes about _XOPEN_CRYPT.
Date: Sat, 14 Apr 2018 07:39:11 +0200
Message-ID: <CAKgNAkgx3h7zxFCv1zt1562FXH8B61jrUBKEB05RR1aiLdFi-g@mail.gmail.com>
References: <6d9a7e45-5d31-efbd-78ad-2808d492eb21@redhat.com> <67f35157-514b-a996-5fd5-78d70eb87395@2c3t.io>
Reply-To: mtk.manpages@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <libc-alpha-return-91551-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <67f35157-514b-a996-5fd5-78d70eb87395@2c3t.io>
To: Rical Jasan <rj@2c3t.io>
Cc: Carlos O'Donell <carlos@redhat.com>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, Florian Weimer <fweimer@redhat.com>, Zack Weinberg <zackw@panix.com>, GNU C Library <libc-alpha@sourceware.org>
List-Id: linux-man@vger.kernel.org

Hi Rical,

On 14 April 2018 at 06:43, Rical Jasan <rj@2c3t.io> wrote:
> On 04/12/2018 12:05 PM, Carlos O'Donell wrote:
>> diff --git a/man3/crypt.3 b/man3/crypt.3
>> index 3e6552ad8..58c62d93d 100644
>> --- a/man3/crypt.3
>> +++ b/man3/crypt.3
>> @@ -188,8 +188,26 @@ POSIX.1-2001, POSIX.1-2008, SVr4, 4.3BSD.
>>  .BR crypt_r ()
>>  is a GNU extension.
>>  .SH NOTES
>> -.SS Glibc notes
>> -The glibc2 version of this function supports additional
>> +.SS Availability in glibc
>> +The
>> +.BR crypt (),
>> +.BR encrypt (),
>> +and
>> +.BR setkey ()
>> +functions are part of the POSIX.1-2008 XSI Options Group for Encryption
>> +and are optional. If the interfaces are not available then the symbolic
>> +constant
>> +.BR _XOPEN_CRYPT
>> +is either not defined or defined to -1, and can be checked at runtime with
>> +.BR sysconf ().
>> +This may be the case if the downstream distribution has switched from glibc
>> +crypt to libxcrypt.  When recompiling applications in such distributions the
>> +user must detect if
>> +.BR _XOPEN_CRPYT
>
> "CRYPT"
>
> (Looks like this was caught already.)

Yup.

>> +is not available and include crypt.h for the function prototypes; otherwise
>> +libxcrypt is a ABI compatible drop-in replacement.
>
> "an ABI"

Already found and fixed.

> I would also hyphenate "ABI-compatible".

Agreed, and already fixed.

> (The same issues were also in encrypt.3 but it sounds like the content
> was deduplicated already.)

Correct.

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
