From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] listxattr.2: provide example code
Date: Mon, 09 Feb 2015 10:22:49 +0100
Message-ID: <54D87C69.6040008@gmail.com>
References: <1423412528-11512-1-git-send-email-xypron.glpk@gmx.de>, <54D872EE.8070000@gmail.com> <trinity-8f8ea4c5-76d3-462f-8ec4-c6ead7c3f6d4-1423473495556@msvc245>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <trinity-8f8ea4c5-76d3-462f-8ec4-c6ead7c3f6d4-1423473495556@msvc245>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, Andreas Gruenbacher <a.gruenbacher-bdq14YP6qtRg9hUCZPvPmw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Heinrich

On 02/09/2015 10:18 AM, Heinrich Schuchardt wrote:
> Hello Michael,
> 
> listxattr is implemented individually by the different filesystems.
> 
> Tmpfs delivered a double zero in my tests. The length included this double zero.
> 
> I need to check the coding of all file systems. They might be different.

Oh -- was unaware of that oddity of tmpfs! That sounds like a bug to me.
All of the traditional filesystems don't return doubled null at the end
of the buffer, AFAIK.

Cheers,

Michael


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
