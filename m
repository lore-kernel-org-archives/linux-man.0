From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH manpages 0/2] Improve modify_ldt, [gs]et_thread_area docs
Date: Fri, 30 Jan 2015 13:18:14 +0100
Message-ID: <54CB7686.1030302@gmail.com>
References: <cover.1422568013.git.luto@amacapital.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1422568013.git.luto@amacapital.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Lutomirski <luto@amacapital.net>
Cc: linux-kernel@vger.kernel.org, mtk.manpages@gmail.com, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

On 01/29/2015 10:47 PM, Andy Lutomirski wrote:
> The docs for set_thread_area, get_thread_area, and modify_ldt are pretty
> bad, and there have been a number of kernel changes lately.  Improve
> and update the docs.

Thanks very much for this, Andy! Those pages were indeed in a sorry 
state.

Cheers,

Michael

> Andy Lutomirski (2):
>   modify_ldt.2: Overhaul the documentation
>   arch_prctl.2, set_thread_area.2, get_thread_area.2: Improve TLS
>     documentation
> 
>  man2/arch_prctl.2      |  22 +++++++----
>  man2/get_thread_area.2 |  58 +---------------------------
>  man2/modify_ldt.2      | 101 ++++++++++++++++++++++++++++++++++++++-----------
>  man2/set_thread_area.2 |  93 ++++++++++++++++++++++++++++++++++++++++++---
>  4 files changed, 180 insertions(+), 94 deletions(-)
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
