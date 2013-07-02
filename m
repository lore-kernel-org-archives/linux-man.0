From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: Re: perf_event_open() - add PERF_IOC_FLAG_GROUP documentation
Date: Tue, 2 Jul 2013 09:55:26 -0400 (EDT)
Message-ID: <alpine.DEB.2.10.1307020953400.8087@vincent-weaver-1.um.maine.edu>
References: <alpine.DEB.2.10.1306281651100.10799@vincent-weaver-1.um.maine.edu> <51D2525F.7070900@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51D2525F.7070900-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, 2 Jul 2013, Michael Kerrisk wrote:

> On 06/28/13 22:55, Vince Weaver wrote:
> > 
> > The perf_event_open() ENABLE/DISABLE/RESET ioctls can take an argument,
> > PERF_IOC_FLAG_GROUP.  This wasn't documented at all until about a year
> > ago (despite the support being there from the beginning) so I missed
> > this when initially writing the manpage.
> > 
> > Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
> 
> Thanks, Vince. Applied.

Just noticed the following typos in that patch; sorry for not catching 
these before sending out the original.

Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
index 862913b..dc04232 100644
--- a/man2/perf_event_open.2
+++ b/man2/perf_event_open.2
@@ -1588,7 +1588,7 @@ is the amount of data actually dumped (can be less than
 .I weight 
 If
 .B PERF_SAMPLE_WEIGHT
-is enabled, then a 64 bit value provided by the hardwre
+is enabled, then a 64 bit value provided by the hardware
 is recorded that indicates how costly the event was.
 This allows expensive events to stand out more clearly
 in profiles.
@@ -1837,7 +1837,7 @@ Using an argument of 0 is considered undefined behavior.
 .TP
 .B PERF_EVENT_IOC_RESET
 Reset the event count specified by the
-file descriptor argumentto zero.
+file descriptor argument to zero.
 This resets only the counts; there is no way to reset the
 multiplexing
 .I time_enabled
@@ -1852,7 +1852,7 @@ reset, even if the event specified is not the group leader.
 
 If the
 .B PERF_IOC_FLAG_GROUP
-bit is not set, then the behavior is somwhat unexpected:
+bit is not set, then the behavior is somewhat unexpected:
 when sent to a group leader only the leader is reset 
 (children are left alone); 
 when sent to a child all events in a group are reset.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
