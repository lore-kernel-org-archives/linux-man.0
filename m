From: Stas Sergeev <stsp@list.ru>
Subject: Re: Documenting sigaltstack SS_AUTODISRM
Date: Mon, 30 Oct 2017 13:58:11 +0300
Message-ID: <d6974f33-cfdb-fdbc-8d8a-1b3dc43d6ee0@list.ru>
References: <CAKgNAkjw_OBxcL627V9xMrKUei69hwjVCr6sbHbG2riBe7VVYw@mail.gmail.com>
 <08467ae1-7187-3b2a-9a78-8af0c10bf816@list.ru>
 <3907bc2a-0645-8d93-6ee5-3f99874e7022@gmail.com>
 <32d95303-5839-9279-a1d3-a06f34e3484e@list.ru>
 <CAKgNAkgw6P5RAsA2RSFJX57b=DHM=eNZ+ZOoagcO3ydSHzBcQA@mail.gmail.com>
 <50de8f3b-8a1e-df50-b5dd-d1b74cb77fad@list.ru>
 <026308b5-4e92-4439-1eb2-82b67584d548@gmail.com>
 <3a4f9f3e-fc33-cf98-2322-27087664813f@list.ru>
 <a5565692-7f23-d236-3b01-142088310741@gmail.com> <59F6FD39.40502@bfs.de>
 <a8ae5fc2-055c-2939-a692-2339398bf653@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a8ae5fc2-055c-2939-a692-2339398bf653@gmail.com>
Content-Language: en-MW
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, wharms@bfs.de
Cc: linux-man <linux-man@vger.kernel.org>, Andy Lutomirski <luto@amacapital.net>, Oleg Nesterov <oleg@redhat.com>, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

30.10.2017 13:50, Michael Kerrisk (man-pages) пишет:
> I see what you mean. The point is back then that SS_ONSTACK was
> the only flag that could (on Linux) be specified in ss.ss_flags,
> so that "SS_ONSTACK | SOMETHING_FLAG" was a nonexistent case.
> These days, it's possible to specify the new SS_AUTODISARM
> flag in ss.ss_flags, which I think is why you are doubtful
> about the new page text. How about this, as a tightened-up
> version:
>
>      BUGS
>         In Linux 2.2 and earlier, the only flag that could be specified in
>         ss.sa_flags  was SS_DISABLE.  In the lead up to the release of the
>         Linux 2.4 kernel, a change was  made  to  allow  sigaltstack()  to
>         allow   ss.ss_flags==SS_ONSTACK   with   the   same   meaning   as
>         ss.ss_flags==0 (i.e., the inclusion of SS_ONSTACK  in  ss.ss_flags
>         is  a no-op).  On other implementations, and according to POSIX.1,
>         SS_ONSTACK appears only as a reported flag in old_ss.ss_flags.  On
>         Linux, there is no need ever to specify SS_ONSTACK in ss.ss_flags,
>         and indeed doing so should be avoided on portability grounds: var‐
>         ious  other  systems  give  an error if SS_ONSTACK is specified in
>         ss.ss_flags.
>
And after all these amendments it seems to
no longer belong to BUGS section but to NOTES.
