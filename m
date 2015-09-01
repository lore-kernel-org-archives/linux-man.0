From: Yury Gribov <y.gribov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [patch] ld.so.8: outline missed cases of secure run
Date: Tue, 01 Sep 2015 10:18:58 +0300
Message-ID: <55E55162.5080702@samsung.com>
References: <"01f701d0e407$c718f530$554adf90$@guseva"@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <"01f701d0e407$c718f530$554adf90$@guseva"@samsung.com>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maria Guseva <m.guseva-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, v.garbuzov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/31/2015 07:12 PM, Maria Guseva wrote:
> Hello,
>
> For the purpose of security many ld.so options(e.g. --inhibit-rpath,
> LD_LIBRARY_PATH and others) are disabled for secure types of programs.
> Current ld.so man page mentions them as set-user-ID/set-group-ID binaries.
> However according to GNU libc sources there could be other cases where
> __libc_enable_secure is set to non-zero -- when AT_SECURE value is set in
> auxiliary vector:

While at it, could you also mention that /etc/suid-debug enables 
LD_DEBUG for suids?

Best regards,
Yury Gribov

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
