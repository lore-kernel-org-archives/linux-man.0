From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [patch] pow.3: Add note on performance characteristics of pow
Date: Tue, 11 Nov 2014 13:58:33 +0100
Message-ID: <546207F9.9050308@gmail.com>
References: <CAESRpQDx5TfgfRp1q69NiuCB5ve8+fR1NC2up9h5LOkogMKkqQ@mail.gmail.com> <5440A816.8000002@gmail.com> <20141017075845.GL1552@spoyarek.pnq.redhat.com> <CAESRpQB5K9U1sBreXUrNa4tPB69cwxC+fdu1bUr5BkU-dtxJMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <libc-alpha-return-54224-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <CAESRpQB5K9U1sBreXUrNa4tPB69cwxC+fdu1bUr5BkU-dtxJMQ@mail.gmail.com>
To: =?windows-1252?Q?Manuel_L=F3pez-Ib=E1=F1ez?= <lopezibanez@gmail.com>, Siddhesh Poyarekar <siddhesh@redhat.com>
Cc: mtk.manpages@gmail.com, linux-man@vger.kernel.org, GNU C Library <libc-alpha@sourceware.org>
List-Id: linux-man@vger.kernel.org

Hello Manuel,

On 10/17/2014 03:51 PM, Manuel López-Ibáñez wrote:
> On 17 October 2014 09:58, Siddhesh Poyarekar <siddhesh@redhat.com> wrote:
>>>> +inputs. The inputs that produce such behavior are different for
>>>> +.BR powf (),
>>>> +.BR pow ()
>>>> +and
>>>> +.BR powl ().
>>>> +
>>
>> The slow fallback is only taken for pow, not powf or powl.
> 
> Updated patch inline:
> 
> diff --git a/man3/pow.3 b/man3/pow.3
> index d0a2ea8..1b05292 100644
> --- a/man3/pow.3
> +++ b/man3/pow.3
> @@ -320,6 +320,18 @@ The variant returning
>  also conforms to
>  SVr4, 4.3BSD, C89.
>  .SH BUGS
> +On 64-bits,
> +.\"
> +.\" https://sourceware.org/bugzilla/show_bug.cgi?id=13932
> +.BR pow ()
> +may be more than 10,000 times slower for some (rare) inputs than for
> other nearby
> +inputs.  This only affects
> +.BR pow (),
> +and not
> +.BR powf ()
> +nor
> +.BR powl ().
> +
>  In glibc 2.9 and earlier,
>  .\"
>  .\" http://sources.redhat.com/bugzilla/show_bug.cgi?id=6776
> 
> and attached in case gmail messes it up.

Thanks for revising the patch. I've applied it.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
