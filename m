From: "Michael Kerrisk (man-opages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 00/15] Updates of in-kernel documentation pointers
Date: Mon, 11 Sep 2017 15:54:01 +0200
Message-ID: <70446a5f-7d7a-58f3-6fb5-c70b704fbe54@gmail.com>
References: <20170911030347.GA24854@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170911030347.GA24854-ZbobWygYI+YXGNroddHbYwC/G2K4zDHf@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Eugene,

On 09/11/2017 05:03 AM, Eugene Syromyatnikov wrote:
> Hello.
> 
> I've noticed that some of Linux kernel in-tree documentation pointers
> are no longer valid and decided to check the validity for the rest of
> them with some one-liner. As it turned out, there are quite a few of
> them, in part due to latest ReST conversion effort. This patch set aims
> at amending documentation pointers that are no longer valid with the
> information about current location. I'm not quite sure about
> wording/formatting, and do not guarantee that I haven't miss anything,
> so I hope that this could be at least useful as a starting point.

Thanks. I new a bunch of fixes must be needed because of the ReST 
changes, but had not yet taken a look.

The patches look great thanks for preserving the historical information.

A couple of minor tweaks for future commit messages:

1. Capitalize the first word after the file list in the patch title:

    E.g., instead of "usnshare.2: some text" use "unshare.2: "Some text"

2. In the body of the commit message, I prefer the text to be no wider
    than 66 columns.

These points help with my scripts that generate the release changelog.
I've fixed all of these details in the patches you've sent.

Thanks,

Michael

> Eugene Syromyatnikov (15):
>    add_key.2, request_key.2, keyrings.7: update Linux documentation
>      pointers
>    prctl.2, ptrace.2: update pointer to in-kernel Yama documentation
>    prctl.2: update pointer to in-kernel no_new_privs flag documentation
>    prctl.2, seccomp.2: update pointer to in-kernel seccomp documentation
>    unshare.2: update pointer to in-kernel unshare documentation
>    initrd.4: update pointer to in-kernel root over NFS documentation
>    initrd.4, proc.5, bootparam.7: update pointer to in-kernel initrd
>      documentation
>    proc.5: document removal of htab-reclaim sysctl file
>    proc.5: document removal of timer_stats file
>    proc.5: update pointer to in-kernel security keys documentation
>    proc.5: update reference to kernel's crypto API documentation
>    proc.5: update pointer to in-kernel MTRR documentation
>    proc.5: update pointer to in-kernel SysRq documentation
>    cpuset.7: update pointer to in-kernel cpusets documentation
>    unicode.7: update pointer to in-kernel Unicode terminal support
>      documentation
> 
>   man2/add_key.2     |  8 +++++++-
>   man2/prctl.2       | 18 +++++++++++++++---
>   man2/ptrace.2      |  4 ++++
>   man2/request_key.2 |  8 +++++++-
>   man2/seccomp.2     |  6 +++++-
>   man2/unshare.2     |  6 +++++-
>   man4/initrd.4      | 14 +++++++++++++-
>   man5/proc.5        | 54 ++++++++++++++++++++++++++++++++++++++++++++----------
>   man7/bootparam.7   |  6 +++++-
>   man7/cpuset.7      |  6 +++++-
>   man7/keyrings.7    |  4 +++-
>   man7/unicode.7     |  6 +++++-
>   12 files changed, 118 insertions(+), 22 deletions(-)
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
