From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 89551] GNU is frequently spelled Gnu
Date: Fri, 12 Dec 2014 13:00:38 +0000
Message-ID: <bug-89551-11311-vIdyPW9V4P@https.bugzilla.kernel.org/>
References: <bug-89551-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-89551-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=89551

Roland Kletzing <devzero-S0/GAf8tV78@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |devzero-S0/GAf8tV78@public.gmane.org

--- Comment #1 from Roland Kletzing <devzero-S0/GAf8tV78@public.gmane.org> ---
here is a list done via find/grep :

./Documentation/Changes:o  Gnu C                  3.2                     # gcc
--version
./Documentation/Changes:o  Gnu make               3.80                    #
make --version
./Documentation/Changes:You will need Gnu make 3.80 or later to build the
kernel.
./arch/arm/nwfpe/ARM-gcc.h:example, the Gnu C Compiler (`gcc') requires that
64-bit literals be
./drivers/net/ethernet/i825xx/sun3_82586.c: * same Gnu Public License that
covers that work.
./drivers/net/ethernet/i825xx/sun3_82586.h: * same Gnu Public License that
covers that work.
./net/ipx/af_ipx.c: *   All the material in this file is subject to the Gnu
license version 2.
./scripts/ver_linux:'NR==1{print "Gnu C                 ", $1}'
./scripts/ver_linux:      '/GNU Make/{print "Gnu make              ",$NF}'


if you want this fixed, i think the best way to proceed is to send patches to
lkml.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
