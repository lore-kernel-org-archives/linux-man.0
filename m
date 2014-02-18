From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 70801] ptrace PEEKDATA API is incorrect
Date: Tue, 18 Feb 2014 22:37:00 +0000
Message-ID: <bug-70801-11311-PUDMpgmvTH@https.bugzilla.kernel.org/>
References: <bug-70801-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-70801-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=70801

Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org

--- Comment #1 from Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> ---
it depends entirely on the arch.  a bunch do as the man page describes.  the
generic ptrace layer is not used by a bunch.

for example alpha/kernel/ptrace.c:
    case PTRACE_PEEKTEXT: /* read word at location addr. */
    case PTRACE_PEEKDATA:
        copied = access_process_vm(child, addr, &tmp, sizeof(tmp), 0);
        ret = -EIO;
        if (copied != sizeof(tmp))
            break;

        force_successful_syscall_return();
        ret = tmp;
        break;

or ia64/kernel/ptrace.c:
    case PTRACE_PEEKTEXT: 
    case PTRACE_PEEKDATA:
        /* read word at location addr */
        if (access_process_vm(child, addr, &data, sizeof(data), 0)
            != sizeof(data))
            return -EIO;
        /* ensure return value is not mistaken for error code */
        force_successful_syscall_return();
        return data;

it's the API that strace uses:
strace/util.c:
        u.val = ptrace(PTRACE_PEEKDATA, pid, (char *) addr, 0);

the generic glibc ignores it too:
glibc/misc/ptrace.c:
    case PTRACE_PEEKDATA:
      va_start(ap, request);
      pid = va_arg(ap, pid_t);
      addr = va_arg(ap, void *);
      va_end(ap);
      break;

although apparently glibc's linux layer has been rewriting this silently:
  if (request > 0 && request < 4)
    data = &ret;
...
  if (res >= 0 && request > 0 && request < 4)
    {
      __set_errno (0);
      return ret;
    }

where request {1,2,3} are PTRACE_PEEK{TEXT,DATA,USER}

as mentioned before, the man page is geared towards documenting the C library
interface rather than the syscall one.  so the current docs are correct.  this
could use noting in the NOTES section.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
