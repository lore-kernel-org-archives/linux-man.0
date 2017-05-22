From: Stas Sergeev <stsp@list.ru>
Subject: Re: Documenting sigaltstack SS_AUTODISRM
Date: Tue, 23 May 2017 02:36:47 +0300
Message-ID: <08467ae1-7187-3b2a-9a78-8af0c10bf816@list.ru>
References: <CAKgNAkjw_OBxcL627V9xMrKUei69hwjVCr6sbHbG2riBe7VVYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKgNAkjw_OBxcL627V9xMrKUei69hwjVCr6sbHbG2riBe7VVYw@mail.gmail.com>
Content-Language: en-MW
Sender: linux-kernel-owner@vger.kernel.org
To: mtk.manpages@gmail.com
Cc: linux-man <linux-man@vger.kernel.org>, Andy Lutomirski <luto@amacapital.net>, Oleg Nesterov <oleg@redhat.com>, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

22.05.2017 23:38, Michael Kerrisk (man-pages) пишет:
> Stas,
>
> I have attempted to document the SS_AUTODISARM feature that you added
> in Linux 4.7.
>
> Could you please take a look at the SS_AUTODISARM pieces in the
> sigaltstack() man page below? There is also one FIXME that I would
> like help with.
>
> It seems to me that the API has become rather odd now. It is no longer
> possible to simply check whether code is executing on an alternative
> stack by using
>
>      sigaltstack(NULL, &old_ss);
>      if (old_ss.ss_flags & SS_ONSTACK)
You mean, if SS_AUTODISARM was previously used, right?
Because I don't think we broke the existing code, or did we?
I can vaguely recall that I was submitting the patches
that were returning SS_ONSTACK even when SS_AUTODISARM
was used, but they were considered too complex.
This is possible to implement, but the agreement was
that it is not a big deal.

>         ss.ss_flags
>                This field contains either 0, or the following flag:
Is this correct?
AFAIK it can be SS_DISABLE too, and posix seems to allow any
other value for enable, which can be (on linux) SS_ONSTACK,
not only 0.
And SS_AUTODISARM can be ORed with the value.

>                ┌─────────────────────────────────────────────────────┐
>                │FIXME                                                │
>                ├─────────────────────────────────────────────────────┤
>                │Was it intended that one  can  set  up  a  different │
>                │alternative signal stack in this scenario? (In pass‐ │
>                │ing,  if  one  does  this,   the   sigaltstack(NULL, │
>                │&old_ss)  now returns old_ss.ss_flags==SS_AUTODISARM │
>                │rather  than  old_ss.ss_flags==SS_DISABLE.  The  API │
>                │design here seems confusing...                       │
>                └─────────────────────────────────────────────────────┘
My memory may be wrong here, but I think setting
up another alt stack was not supposed because the
previous settings would be restored upon sighandler
return. AFAIK I was trying to make up a proposal to
get such attempts explicitly blocked rather than
silently ignored, but again the simplicity was chosen.

>         SS_AUTODISARM
>                The  alternate  signal  stack  has  been  marked  to  be
>                autodisarmed as described above.
Initially this flag was supposed to be ORed with
the old values. Your descrition is correct, but if
more bit flags are added, this may became a
problem, as you are always treating it as a separate
value, not a bit flag.
