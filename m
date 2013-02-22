From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 23282] vsnprintf(3) example promotes code which ignores error
 return code
Date: Fri, 22 Feb 2013 23:01:24 +0000 (UTC)
Message-ID: <20130222230124.EDF0311FB84@bugzilla.kernel.org>
References: <bug-23282-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-23282-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=23282





--- Comment #11 from Graham Gower <graham.gower-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2013-02-22 23:01:24 ---
Marshal, I don't apreciate being constantly badgered to review your patch.
*One* email, or *one* comment here would have sufficed.


>--- a/man3/printf.3
>+++ b/man3/printf.3
>@@ -892,7 +892,9 @@ and
> conforms to the C99 standard, that is, behaves as described above,
> since glibc version 2.1.
> Until glibc 2.0.6 they would return \-1
>-when the output was truncated.
>+when the output was truncated.In current implementation a negative value 
>+is returned if an output error is encountered(see Return Value).Hence
>+these functions are not compatible with glibc 2.0.6 and before.

I'm unfamiliar with man page formatting conventions, but a cursory look at the
rest of this file indicates that new sentences should be on new lines. In any
event, I don't think this text adds anything useful.

> .\" .SH HISTORY
> .\" UNIX V7 defines the three routines
> .\" .BR printf (),
>@@ -1024,7 +1026,7 @@ With the value:
> one might obtain "Sonntag, 3. Juli, 10:02".
> .PP
> To allocate a sufficiently large string and print into it
>-(code correct for both glibc 2.0 and glibc 2.1):
>+(code incompatible for glibc 2.0.6 and before):

How about
"If truncation occurs in glibc versions prior to 2.0.6, this is treated as an
error instead of being handled gracefully"

> .nf
> 
> #include <stdio.h>
>@@ -1050,18 +1052,21 @@ make_message(const char *fmt, ...)
>         n = vsnprintf(p, size, fmt, ap);
>         va_end(ap);
> 
>+	/* Check error code */
>+	
>+	if (n < 0)
>+	    return NULL ;
>+	     

The indentation here is not consistent with the rest of the example.

>         /* If that worked, return the string. */
> 
>-        if (n > \-1 && n < size)
>+        if (n < size)
>             return p;
> 
>         /* Else try again with more space. */
> 
>-        if (n > \-1)    /* glibc 2.1 */
>+        else
>             size = n+1; /* precisely what is needed */
>-        else           /* glibc 2.0 */
>-            size *= 2;  /* twice the old size */
>-
>+        
>         if ((np = realloc (p, size)) == NULL) {
>             free(p);
>             return NULL;
>-- 
>1.7.0.4

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
