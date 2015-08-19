From: "S. Gilles" <sgilles-X9d1TDB9xtu3n+kRt3O4EA@public.gmane.org>
Subject: Constancy of non-standard sysconf() calls
Date: Wed, 19 Aug 2015 00:22:32 -0400
Message-ID: <20150819042232.GY5334@number18>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The manual for sysconf() currently reads

    The values obtained from these functions are system configuration
    constants.  They do not change during the lifetime of a process.

This is not strictly true for some of the non-standard options. In
particular, sysconf(_SC_NPROCESSORS_ONLN) may change on a hotpluggable
machine during the life of a program (at least with glibc 2.21). For example:

#include <stdio.h>
#include <unistd.h>

int
main(void)
{
        while (1) {
                printf("%ld\n", sysconf(_SC_NPROCESSORS_ONLN));
                sleep(1);
        }

        return 0;
}

may print different things over time if, during the running life of
the program, I twiddle with /sys/devices/system/cpu/cpu*/online .

This value is noted as possibly non-standard, and is certainly not
standard in the wild (e.g. musl-libc treats _SC_NPROCESSORS_ONLN as
_SC_NPROCESSORS_CONF, while under glibc the two arguments can give
different results), but the current wording of the page seems to cover
even non-standard values.  Perhaps the unchangingness could be
qualified, for example

    When given standard arguments as defined below, these functions
    return values that are system configuration constants.  They do
    not change during the lifetime of a process.

How does this sound?

-- 
S. Gilles
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
