From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] ld.so.8: outline missed cases of secure run
Date: Mon, 14 Sep 2015 20:42:21 +0200
Message-ID: <CAKgNAkjgs9rBz8MvgMW1Xts95nBo433RAvoyOZFKuU6cDFO_zg@mail.gmail.com>
References: <01f701d0e407$c718f530$554adf90$@guseva@samsung.com> <55E55162.5080702@samsung.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55E55162.5080702-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yury Gribov <y.gribov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Maria Guseva <m.guseva-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, v.garbuzov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

Yury,

On 1 September 2015 at 09:18, Yury Gribov <y.gribov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> On 08/31/2015 07:12 PM, Maria Guseva wrote:
>>
>> Hello,
>>
>> For the purpose of security many ld.so options(e.g. --inhibit-rpath,
>> LD_LIBRARY_PATH and others) are disabled for secure types of programs.
>> Current ld.so man page mentions them as set-user-ID/set-group-ID binaries.
>> However according to GNU libc sources there could be other cases where
>> __libc_enable_secure is set to non-zero -- when AT_SECURE value is set in
>> auxiliary vector:
>
>
> While at it, could you also mention that /etc/suid-debug enables LD_DEBUG
> for suids?

Does it? I can't see that in the glibc source. Am I missing something?

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
