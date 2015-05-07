From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug
 84151]=?UTF-8?Q?=20right=20and=20side=20=E2=86=92=20right=20hand=20side?=
Date: Thu, 07 May 2015 04:45:20 +0000
Message-ID: <bug-84151-11311-Z9neqIxbpc@https.bugzilla.kernel.org/>
References: <bug-84151-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-84151-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=84151

--- Comment #3 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Dan,

(In reply to Dan Jacobson from comment #2)
> 1) There is only a vague mention of a list at the bottom of that page. No
> mention of a person.

Did you look in MAINTAINERS?

DOCUMENTATION
M:      Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>
L:      linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
S:      Maintained
F:      Documentation/
X:      Documentation/ABI/
X:      Documentation/devicetree/
X:      Documentation/acpi
X:      Documentation/power
X:      Documentation/spi
T:      git git://git.lwn.net/linux-2.6.git docs-next


> 2) If I send a message to that list will the problem will get solved, or
> might it drop through the cracks and get ignored maybe.

Did you try?

> 3) Please reassign this bug to the correct component.

Who says there is a correct component? Not every kernel component makes use
Bugzilla.

In any case, raising reports for trivial problems like this really is a waste
of everyone's time. Please don't do it. Do some minimal research (see "1)") to
find the best path for solving the problem and send a patch.

Thanks,

Michael

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
