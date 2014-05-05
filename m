From: Jan Kara <jack@suse.cz>
Subject: Re: fanotify man pages for review
Date: Mon, 5 May 2014 20:07:06 +0200
Message-ID: <20140505180706.GH23927@quack.suse.cz>
References: <535FAE78.5050404@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <535FAE78.5050404@gmail.com>
Sender: linux-fsdevel-owner@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Eric Paris <eparis@redhat.com>, Jan Kara <jack@suse.cz>, Linux-Fsdevel <linux-fsdevel@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

  Hello,

  below are some minor comments regarding the manpages.

> diff --git a/man2/fanotify_mark.2 b/man2/fanotify_mark.2
> new file mode 100644
> index 0000000..693eff8
> --- /dev/null
> +++ b/man2/fanotify_mark.2
...
> +.B FAN_MARK_IGNORED_SURV_MODIFY
> +The ignore mask shall survive modify events.
> +If this flag is not set, the ignore mask is cleared when a modify event occurs
> +for the ignored file or directory.
  This is correct but maybe we should explicitely stress that the modify
event doesn't have to be delivered to the fanotify group? I.e. the
clearing happens even if the mark doesn't have FAN_MODIFY set... But maybe
it would just unecessarily complicate the explanation. Just a suggestion.

> diff --git a/man7/fanotify.7 b/man7/fanotify.7
> new file mode 100644
> index 0000000..083244f
> --- /dev/null
> +++ b/man7/fanotify.7
...
> +A possible usage of the ignore mask is for a file cache.
> +Events of interest for a file cache are modification of a file and closing
> +of the same.
> +Hence, the cached directory or mount point is to be marked to receive these
> +events.
> +After receiving the first event informing that a file has been modified, the
> +corresponding cache entry will be invalidated.
> +No further modification events for this file are of interest until the file is
> +closed.
> +Hence, the modify event can be added to the ignore mask.
> +Upon receiving the closed event, the modify event can be removed from the
                      ^^^^ close

> +ignore mask and the file cache entry can be updated.
> +.PP
> +The entries in the fanotify notification groups refer to files and directories
> +via their inode number and to mounts via their mount ID.
> +If files or directories are renamed or moved, the respective entries survive.
> +If files or directories are deleted or mounts are unmounted, the corresponding
> +entries are deleted.
> +.SS The event queue
> +As events occur on the filesystem objects monitired by a notification group,
                                             ^^^ monitored

> +the fanotify system generates events that are collected in a queue.
> +These events can then be read (using
> +.BR read (2)
> +or similar)
> +from the fanotify file descriptor
> +returned by
> +.BR fanotify_init (2).
> +
> +Two types of events are generated:
> +notification events and permission events.
> +Notification events are merely informative
> +and require no action to be taken by
> +the receiving application except for closing the file descriptor passed in the
> +event.
> +Permission events are requests to the receiving application to decide whether
> +permission for a file access shall be granted.
> +For these events, the recipient must write a response which decides whether
> +access is granted or not.
> +
> +Queue entries for notification events are removed when the event has been
> +read.
> +Queue entries for permission events are removed when the permission
> +decision has been taken by writing to the fanotify file descriptor.
  This is true however it may be slightly misleading - the permission
events are removed from the queue as soon as they are read. But they are
destroyed only after the permission response is received. So from
userspace POV dequeued events are invisible...

> +A program listening to fanotify events can compare this PID to the PID returned
> +by
> +.BR getpid (2),
> +to determine whether the event is caused by the listener itself, or is due to a
> +file access by another program.
> +.PP
> +The bit mask in
> +.I mask
> +signals which events have occurred for a single filesystem object.
> +Multiple bits may be set in this mask,
> +if more than one event occurred for the monitored filesystem obect.
                                                                ^^ object

> +.B ENOENT
> +The file descriptor
> +.I fd
> +in the response structure is not valid.
> +This might occur because the file was already deleted by another thread or
> +process.
  This isn't quite true. Another thread of the same process may have already
closed the 'fd'. But it has nothing to do with a file being deleted.
fanotify uses file descriptors exactly so that renames or deletes don't
make the event invalid.

								Honza
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
