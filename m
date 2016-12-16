From: "Serge E. Hallyn" <serge-A9i7LUbDfNHQT0dZR+AlfA@public.gmane.org>
Subject: Re: RFC: capabilities(7): notes for kernel developers
Date: Fri, 16 Dec 2016 14:10:26 -0600
Message-ID: <20161216201026.GB14856@mail.hallyn.com>
References: <cdbc35f2-925e-aa65-98e7-a4ae4a5ded2c@gmail.com>
 <edb66332-86c9-6122-85c5-f856309cbfc1@schaufler-ca.com>
 <43dcc6dc-265b-5eaf-3a70-701e05200b9f@gmail.com>
 <9ed6371f-3d38-45b1-a85b-1fbb3e5b4fc7@schaufler-ca.com>
 <CALAqxLWr8+GpGG+geibKQqPxGHtPQbzYjEptjA4r+jNcRrMWvw@mail.gmail.com>
 <7a6b5f38-de8e-d8d4-e6f7-feae3f8d192e@schaufler-ca.com>
 <e8a6d266-9870-2591-576b-927208683b5d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <e8a6d266-9870-2591-576b-927208683b5d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Casey Schaufler <casey-iSGtlc1asvQWG2LlvL+J4A@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Serge E. Hallyn" <serge-A9i7LUbDfNHQT0dZR+AlfA@public.gmane.org>, James Morris <jmorris-gx6/JNMH7DfYtjvyW6yDsg@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>, "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-security-module <linux-security-module-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Quoting Michael Kerrisk (man-pages) (mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org):
> On 12/16/2016 01:44 AM, Casey Schaufler wrote:
> > On 12/15/2016 4:31 PM, John Stultz wrote:
> >> On Thu, Dec 15, 2016 at 12:40 PM, Casey Schaufler
> >> <casey-iSGtlc1asvQWG2LlvL+J4A@public.gmane.org> wrote:
> >>> On 12/15/2016 11:41 AM, Michael Kerrisk (man-pages) wrote:
> >>>> On 12/15/2016 05:29 PM, Casey Schaufler wrote:
> >>>>> CAP_WAKE_ALARM could readily be CAP_TIME.
> >>>> Actually, I don't quite understand what you mean with that sentence.
> >>>> Could you elaborate?
> >>> Should have said CAP_SYS_TIME
> >>>
> >>> Setting an alarm could be considered a time management function,
> >>> depending on what it actually does.
> >> Just a nit here. CAP_WAKE_ALARM is more about the privilege of waking
> >> a system from suspend, while CAP_SYS_TIME covers the ability to set
> >> the time. One wouldn't necessarily want to give applications which
> >> could wake a system up the capability to also set the time.
> > 
> > Doesn't really matter, except that an ignorant developer
> > might make the mistake I did and assume that WAKE_ALARM
> > was somehow related to time management. If you want to use
> > it as an example don't let my dunderheadedness get in your
> > way.
> 
> Actually, I decided it wasn't such a good example anyway.
> That capability could potentially be generic. (But it probably
> should better have been named something like 'CAP_WAKE_SYSTEM'.)

How about:

Subject: [PATCH 1/1] capabilities: alias CAP_WAKE_SYSTEM to CAP_WAKE_ALARM

As suggested by Michael Kerrisk his is a less confusing name, and
this won't break any old userspace.

Signed-off-by: Serge Hallyn <serge-A9i7LUbDfNHQT0dZR+AlfA@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 include/uapi/linux/capability.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/capability.h b/include/uapi/linux/capability.h
index fd4f87d..ba972ff 100644
--- a/include/uapi/linux/capability.h
+++ b/include/uapi/linux/capability.h
@@ -357,6 +357,8 @@ struct vfs_ns_cap_data {
 
 #define CAP_WAKE_ALARM            35
 
+#define CAP_WAKE_SYSTEM      CAP_WAKE_ALARM
+
 /* Allow preventing system suspends */
 
 #define CAP_BLOCK_SUSPEND    36
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
