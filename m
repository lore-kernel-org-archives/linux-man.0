From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH] init_module: update to modern interfaces
Date: Thu, 18 Oct 2012 14:44:36 +1030
Message-ID: <87fw5co1qr.fsf@rustcorp.com.au>
References: <20120920232737.GA2953@www.outflux.net> <CAKgNAkheF8=ssrE=_JP-ApDP5zXeHSYVG+0x6Wfd6U28TcPSHQ@mail.gmail.com> <87wqyx7me7.fsf@rustcorp.com.au> <CAKgNAkiKajiFxjfBEadXBtD67ApyGEvCa+uoWm7iFBBm0gnshA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKgNAkiKajiFxjfBEadXBtD67ApyGEvCa+uoWm7iFBBm0gnshA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mtk.manpages@gmail.com
Cc: Kees Cook <keescook@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-man <linux-man@vger.kernel.org>, Lucas De Marchi <lucas.demarchi@profusion.mobi>, Jon Masters <jonathan@jonmasters.org>
List-Id: linux-man@vger.kernel.org

"Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com> writes:
> Hi Rusty,
>
> Thanks for the review! One open question below.
>
> On Thu, Oct 11, 2012 at 4:50 AM, Rusty Russell <rusty@rustcorp.com.au> wrote:
>> "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com> writes:
>>> [CC widened, so that some more review might come in. Rusty?]
>>
>> Sure.
>>
>> Looks good. but:
>>
>>> .B EBUSY
>>> The module's initialization routine failed.
>>
>> Possibly.  You should mention that the individual module's
>> initialization routine can return other errors as appropriate.
>
> Done!
>
> In fact, the existing EBUSY text seems completely bogus. Should it not
> read something like
> "Timeout while trying to resolve a symbol reference by this module."?

Yes, indeed.

>>> .BR EINVAL " (Linux 2.4 and earlier)"
>>> Some
>>> .I image
>>> slot is filled in incorrectly,
>>> .I image\->name
>>> does not correspond to the original module name, some
>>> .I image\->deps
>>> entry does not correspond to a loaded module,
>>> or some other similar inconsistency.
>>> .TP
>>
>> Why document this?
>
> Because the general approach in man-pages is to document past as well
> as current behavior. Since there are few user-space customers of
> init_module(), perhaps you are right that this is unnecessary. I
> dropped it.

It was just that you didn't refer to the old structure anywhere else...

Thanks,
Rusty.
