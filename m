From: "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [patch] hosts.equiv.5: Clarify that `host <user>` enables non-like-named
 account logins.
Date: Wed, 17 Jun 2015 13:14:18 -0400
Message-ID: <5581AAEA.9090709@redhat.com>
References: <55615A71.4010600@redhat.com>	<557FF511.7040500@gmail.com>	<558091DD.30004@redhat.com> <20150617181755.0bea170c@zion>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150617181755.0bea170c@zion>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arjun Shankar <arjun-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Siddhesh Poyarekar <siddhesh-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 06/17/2015 12:17 PM, Arjun Shankar wrote:
>>> Just a note: I'm hoping for a response from Arjun before I commit this.
>> Hope is not a plan :-)
> 
> I see that I got here a little late. This looks good, but I have one
> nitpick:
> 
>> +Allow user from host to login:
>> +.LP
>> +.RS 4
>> +.TP
>> +host user
> 
> It might make sense to repeat here that such an entry will allow the
> specified user on the remote host to login as *any* user on the local host.
> 
> i.e., something like:
> 
> -Allow user from host to login:
> +Allow user from host to login as any non-root user:

Good point.

Signed-off-by: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

diff --git a/man5/hosts.equiv.5 b/man5/hosts.equiv.5
index b6ecb94..9ee0e6e 100644
--- a/man5/hosts.equiv.5
+++ b/man5/hosts.equiv.5
@@ -116,7 +116,7 @@ Allow
 .I user
 from
 .I host
-to login:
+to login as any non-root user:
 
     host user
 
@@ -152,7 +152,8 @@ Disallow all users on all hosts in a
 Allow all users in a
 .I netgroup
 to log in from
-.IR host :
+.IR host
+as any non-root user:
 
     host +@netgroup
 
---

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
