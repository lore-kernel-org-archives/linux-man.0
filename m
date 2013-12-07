From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 52721] [TRIVIAL]Oudated kernel documentation in
 http://kernel.org/doc/
Date: Sat, 07 Dec 2013 22:26:18 +0000
Message-ID: <bug-52721-11311-VARUfsZBjk@https.bugzilla.kernel.org/>
References: <bug-52721-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-52721-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=52721

--- Comment #7 from Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org> ---
On 11/19/2013 08:02:46 AM, bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=52721
> 
> Alan <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org> changed:
...

I posted the following to the kernel-users list back in September, but  
never got a reply:

On 09/24/2013 10:05:26 AM, Konstantin Ryabitsev wrote:
> Hi, all:
> 
> We already use 2-factor authentication for all admin-level access to
> infrastructure, so I wanted to ask whether it's something you would  
> like
> to see extended to non-admin access, such as for git repositories.

No, but could I raise the possibility of getting a dedicated ssh key  
with a forced rsync receive command line for a specific directory, ala  
page 61 of the slides from this?

http://x47industries.com/presentations/ssh-tips-tricks.html

I'd really, really, really like to be able to update  
http://kernel.org/doc again, and writing a wrapper around kup to  
reimplement a really sad version of rsync has been a combination of  
"painful" and "busy work" that's kept off the first page of my todo  
list for 6 months now...

Rob

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
