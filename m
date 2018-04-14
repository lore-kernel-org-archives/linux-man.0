From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH 1/2] posixoptions.7: Expand XSI Options groups.
Date: Sat, 14 Apr 2018 07:37:50 +0200
Message-ID: <CAKgNAkhXj=SFYSHQPnFxyZDB+r4n1_xdDo+=CUfZqXpqYmL4Cg@mail.gmail.com>
References: <2d6c47e9-0f34-c828-916e-a45fbf90f837@redhat.com> <4d8d0ca1-a612-b3bf-563c-49d0d61856ed@2c3t.io>
Reply-To: mtk.manpages@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <libc-alpha-return-91550-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <4d8d0ca1-a612-b3bf-563c-49d0d61856ed@2c3t.io>
To: Rical Jasan <rj@2c3t.io>
Cc: Carlos O'Donell <carlos@redhat.com>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, Florian Weimer <fweimer@redhat.com>, GNU C Library <libc-alpha@sourceware.org>, Zack Weinberg <zackw@panix.com>
List-Id: linux-man@vger.kernel.org

On 14 April 2018 at 06:43, Rical Jasan <rj@2c3t.io> wrote:
> On 04/12/2018 12:05 PM, Carlos O'Donell wrote:
>> +.B _POSIX_TRACE_INHERIT
>> +options and defined to 200112L.
>
> "are defined"?
>
>> +The option may imply the
>> +.B Encryption (_XOPEN_CRYPT),
>> +.B Realtime (_XOPEN_REALTIME),
>> +.B Advanced Raltime (ADB),
>
> "Realtime"

Yup. Both already found and fixed.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
