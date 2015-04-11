From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH ] ATTRIBUTES: new correct versions
Date: Sat, 11 Apr 2015 08:53:16 +0200
Message-ID: <5528C4DC.6000006@gmail.com>
References: <1428461788-7518-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428461788-7518-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/08/2015 04:56 AM, Zeng Linggang wrote:
> Hi,
> 
> This patch-set is the new correct versions for previous patches from me.
> 
> 1. Fix an English grammar mistake in the title: "those" should be "that".
> 2. Quote the glibc markings in the commit message.
> 
> ps:
> Please *ignore* all patches before this patch-set sent by me.
> Include the child thread about below subject:
> [PATCH v2] getutent.3: ATTRIBUTES: Note functions those aren't thread-safe
> [PATCH] ctime.3: ATTRIBUTES: Note functions thoes aren't thread-safe
> [PATCH] asprintf.3: ATTRIBUTES: Note functions those are thread-safe
> [PATCH] getutent.3: ATTRIBUTES: Note functions those aren't thread-safe

Thanks, Zeng. Perfect! I have applied all of the following, sent by you 
on 8 April:

    asprintf.3: ATTRIBUTES: Note functions that are thread-safe
    ctime.3: ATTRIBUTES: Note functions that aren't thread-safe
    gethostbyname.3: ATTRIBUTES: Note functions that aren't thread-safe
    getnetent.3: ATTRIBUTES: Note functions that aren't thread-safe
    get_nprocs_conf.3: ATTRIBUTES: Note functions that are thread-safe
    getutent.3: ATTRIBUTES: Note functions that aren't thread-safe
    mbsnrtowcs.3: ATTRIBUTES: Note function that isn't thread-safe
    mbsrtowcs.3: ATTRIBUTES: Note function that isn't thread-safe
    perror.3: ATTRIBUTES: Note function that is thread-safe
    printf.3: ATTRIBUTES: Note functions that are thread-safe
    scandir.3: ATTRIBUTES: Note functions that are thread-safe
    scanf.3: ATTRIBUTES: Note functions that are thread-safe
    unlocked_stdio.3: ATTRIBUTES: Note functions that aren't thread-safe
    wcrtomb.3: ATTRIBUTES: Note function that isn't thread-safe
    wcsnrtombs.3: ATTRIBUTES: Note function that isn't thread-safe
    wcsrtombs.3: ATTRIBUTES: Note function that isn't thread-safe
    wprintf.3: ATTRIBUTES: Note functions that are thread-safe

I believe that is everything. Please let me know if there is 
something from you that I should still apply.

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
