From: Vlastimil Babka <vbabka-AlSwsSmVLrQ@public.gmane.org>
Subject: Missing include in mbind(2) and set_mempolicy(2) manpages?
Date: Wed, 18 Jan 2017 13:05:17 +0100
Message-ID: <1d46ea2d-0076-603d-d922-1f414c91cea2@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-numa-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

the two manpages state that you have to #include <numaif.h>
But apparently this is not enough when one wants to use the MPOL_F_STATIC_NODES 
or MPOL_F_RELATIVE_NODES flag. With grep I found that these are defined in 
linux/mempolicy.h.

This is on openSUSE Tumbleweed, numaif.h comes from 
libnuma-devel-2.0.10-5.7.x86_64 (I checked upstream 2.0.11 tarball, no 
difference here).
linux/mempolicy.h is from linux-glibc-devel-4.8-1.1.noarch

Thanks,
Vlastimil
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
