From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] Man pages for the fanotify API
Date: Mon, 24 Mar 2014 22:23:35 +0100
Message-ID: <5330A257.9080100@gmail.com>
References: <53271880.4090100@gmail.com> <1395506528-10026-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395506528-10026-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: xypron.glpk-Mmb7MZpHnFY@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org, james.hunt-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

[Eric-- heads up. I'm pretty sure there's a bug in the fanotify API.
See the discussion of FAN_MARK_FLUSH below.]


Hello Heinrich,

Many more comments below. Sorry, but this is a complex API, and 
there are many corner cases to consider....

==

Some of my past comments seem to have got dropped. Rather than just
sending me a new draft of the page, could you also answer / comment 
on each of the substantial points/questions in this mail (could be
as simple as saying "fixed in new draft"), then I am able to
know what questions remain open.

Some of my substantial points are at the top of this mail, others 
are listed below.

==

What permissions does one need on a file to watch it with
fanotify? That should be documented.

==

The pages say nothing about merging of events. Merging can happen
for non-permission events, but not for permission events.
Something needs to be said about this, probably in fanotify(7)
If you are unsure of what I mean, just add the following in
fanotify(7)

.\" FIXME Document merging of events

==

The discussion of monitoring of directories could be clearer.
To begin with, it wasn't immediately obvious from reading the
page whether one could monitor children of a directory. See the 
text in fanotify_mark.2 for FAN_MARK_MOUNT.  The discussion of 
FAN_ONDIR/FAN_EVENT_ON_CHILD should say somethingsimilar, noting 
that FAN_ONDIR on its own gives just monitoring of directories; 
to monitor children you need  FAN_ONDIR | FAN_EVENT_ON_CHILD.

And some questions. If I monitor a directory ("xxx") and its 
children, creating, modifying, and deleting files in that directory 
generates events as I'd expect. But, if I create a subdirectory 
("xxx/yyy") in that directory, it does not generate an event, and
creating objects in that subdirectory also does not generate events
(i.e., unlike with mount points, monitoring directories is not truly
recursive). Are both of these points correct? If yes, they need 
to be documented in the man page. (rmdir() of the subdirectory
also seems not to generate an event.)

On the other hand, open() and close() of the subdir xxx/yyy 
DO generate events. Strange. What is the rationale, for generating
events there, but not on mkdir()/rmdir(), do you know? 

And, given the above state of affairs, is it possible to reliably
monitor an entire directory subtree (that is not a mount point)?
The lack of mkdir(2)/rmdir(2) notification seems to make that task
difficult or, probably, impossible to do reliably. If it is
possible, the man page should explain how. If it is not pssible, 
the fanotify(7) page should say so explicitly, and I'd be inclined
to put it under the heading BUGS.

fanotify(7) should also mention that fanotify() doesn't detect 
file deletions (unlink(2)) and renames (rename()). Again, 
I'd put this under BUGS.

==

There needs to be some explanation of the events that are generated
for directories. To begin with, *which* events are generated for
directories?

* opening a directory for reading gives FAN_OPEN
* closing the file descriptor from the previous
  step gives FAN_CLOSE
* Changing the directory contents (adding a file)
  seems to give no event for the directory itself
  (but will give an event on the new file, if we
  are monitoring children of the directory)
* Other???

==

Somewhere, this detail about permission events should be made 
clearer:

* Can only set permission events if FAN_CLASS_PRE_CONTENT or 
  FAN_CLASS_CONTENT (not FAN_CLASS_CONTENT) was used to create 
  FAN fd. (EINVAL)

==

I asked this earlier (in a different wording), but it seems not to have 
been addressed:

    What happens if the application hits its file descriptor limit
    (RLIMIT_NOFILES) when handling read()s from the FAN FD? (EMFILE).

This needs to be covered under the errors for read(2).

And now I think of a related question: what if we hit the system-wide
limit on the number of open files (/proc/sys/fs/file-max)? (I suspect 
ENFILE.)

And yet another related question: what if the file in question
is being executed? In this case, we can't get an ETXTBUSY from read().

==

I notice that the FDs returned by read()s from the FAN FD have the
FMODE_NONOTIFY flag (fcntl(F_GETFL)) flag set. If you know what that's 
about, it would be good to say something about. But, if not, do not 
worry--just place a FIXME in the page source of fanotify(7)

.\" FIXME
.\"    The FDs returned by read()s from the FAN FD have the
.\"    FMODE_NONOTIFY flag (fcntl(F_GETFL)) flag set.
.\"    What is the purpose?

Cheers,

Michael


On 03/22/2014 05:42 PM, xypron.glpk-Mmb7MZpHnFY@public.gmane.org wrote:
> From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> 
> Michael,
> 
> thank you for your further comments, which I used to update
> the appended patch.
> 
> O_LARGEFILE is definitely needed on 32-bit Linux when working
> with permission events for files exceeding 2GB.
> 
> gcc -D_FILE_OFFSET_BITS=64
> is also needed but not sufficient.

I'm still a little doubtful about this. How have you verified that 
O_LARGEFILE  is required (or where did you get the info)?

Again, I start with fanotify(7) first.
 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man2/fanotify_init.2 |  208 ++++++++++++++++++++
>  man2/fanotify_mark.2 |  239 +++++++++++++++++++++++
>  man7/fanotify.7      |  519 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 966 insertions(+)
>  create mode 100644 man2/fanotify_init.2
>  create mode 100644 man2/fanotify_mark.2
>  create mode 100644 man7/fanotify.7
> 
> --- /dev/null
> +++ b/man7/fanotify.7
> @@ -0,0 +1,519 @@
> +.\" Copyright (C) 2013, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> +.\" 
> +.\" %%%LICENSE_START(VERBATIM)
> +.\" Permission is granted to make and distribute verbatim copies of this
> +.\" manual provided the copyright notice and this permission notice are
> +.\" preserved on all copies.
> +.\"
> +.\" Permission is granted to copy and distribute modified versions of
> +.\" this manual under the conditions for verbatim copying, provided that
> +.\" the entire resulting derived work is distributed under the terms of
> +.\" a permission notice identical to this one.
> +.\"
> +.\" Since the Linux kernel and libraries are constantly changing, this
> +.\" manual page may be incorrect or out-of-date.  The author(s) assume.
> +.\" no responsibility for errors or omissions, or for damages resulting.
> +.\" from the use of the information contained herein.  The author(s) may.
> +.\" not have taken the same level of care in the production of this.
> +.\" manual, which is licensed free of charge, as they might when working.
> +.\" professionally.
> +.\"
> +.\" Formatted or processed versions of this manual, if unaccompanied by
> +.\" the source, must acknowledge the copyright and authors of this work.
> +.\" %%%LICENSE_END
> +.TH FANOTIFY 7 2014-03-22 "Linux" "Linux Programmer's Manual"
> +.SH NAME
> +fanotify \- monitoring filesystem events
> +.SH DESCRIPTION
> +The
> +.B fanotify
> +API provides notification and interception of filesystem events.
> +Use cases are virus scanning and hierarchical storage management.
> +
> +The following system calls are used with this API:
> +.BR fanotify_init (2),
> +.BR fanotify_mark (2),
> +.BR poll (2),
> +.BR ppoll (2),
> +.BR read (2),
> +.BR write (2),
> +and
> +.BR close (2).
> +.PP
> +.BR fanotify_init (2)
> +creates and initializes a fanotify notification group and returns a file
                           ^^^^^^^^^^
It all depends how you pronounce the name, but I assume "F-A-notify"
and so I'd always write it as "an fanotify" (and in multiple places below).

> +descriptor referring to it.
> +.PP
> +A fanotify notification group is an internal object of the kernel which holds a
> +list of files, directories and mount points for which events shall be created.
> +.PP
> +For each entry two bit masks exist.

Okay. Now I start to get to more subtle editing...

"entry" needs clarification to help the reader know that you mean the 
aforementioned "list".

==>

    For each entry in the fanotify list, 

(Note addition of a comma.)

> +One mask (the mark mask) defines for which file activities an event shall be
> +created.
> +Another mask (the ignore mask) defines for which activities no event shall be
> +created.
> +Having these two types of masks allows that a mount point or directory is
> +marked for receiving events, but no event is raised for specified contained
> +file system objects.

I'd write this as something like:

    Having these two types of masks allows a mount point or directory to be 
    marked for receiving events while at the same time ignoring events for a 
    subdirectory under that mount point or directory.

> +.PP
> +A possible usage of the ignore mask is for a file cache.
> +Events of interest for a file cache are modification of a file and closing
> +of the same. Hence the cached directory or mount point is to be marked to
                ^
Please start each new sentence on a new source line. See man-pages(7).

> +receive these events.

> +After receiving the first event informing that a file has been modified, the
> +corresponding cache entry will be invalidated.
> +No further modification events for this file are of interest until the file is
> +closed.
> +Hence the modify event can be added to the ignore mask.
> +Upon receiving the closed event the modify event can be removed from the ignore
                                  ^
Add comma.

> +mask and the file cache entry can be updated.
> +.PP
> +Two types of events exist.
> +Notification events are only informative and require no action to be taken by
> +the receiving application except for closing the file descriptor passed in the
> +event.
> +Permission events are requests to decide whether permission for a file access

s/are requests/are requests to the receiving application/


> +shall be granted. For these events a response has to be sent.
                     ^
Start each new sentence on a new source line.

"For these events a response has to be sent." could be made a bit more precise 
to help the reader:

    For these events, the recipient must write a response to .....

> +.PP
> +When all file descriptors referring to the fanotify notification group are
s/the/an/
> +closed, the group is released and the resources are freed for reuse by the
> +kernel.
> +.PP
> +.BR fanotify_mark (2)
> +adds a file, a directory, or a mount to the group and specifies which events

s/the group/an fanotify group/

> +shall be reported (or ignored), or removes or modifies such an entry.
> +.PP
> +When a fanotify event occurs the fanotify file descriptor indicates as
                               ^
Add comma. (I appreciate this is tricky for nonnative speakers. German
and English have quite different comma rules.)

> +readable when passed to
> +.BR epoll (7),
> +.BR poll (2),
> +or
> +.BR select (2).
> +.PP
> +Calling
> +.BR read (2)
> +for the file descriptor returned by
> +.BR fanotify_init (2)
> +blocks (if flag

if *the* flag

> +.B FAN_NONBLOCK
> +is not set in the call to

s/set/specified/

> +.BR fanotify_init (2))
> +until either a file event occurs or it is interrupted by a signal
> +(see
> +.BR signal (7)).
> +
> +The return value of
> +.BR read (2)
> +is the length of the filled buffer or \-1 in case of an error.
> +In case of success the read buffer contains one or more of the following
                     ^
Add comma

> +structures:
> +
> +.in +4n
> +.nf
> +struct fanotify_event_metadata {
> +    __u32 event_len;
> +    __u8 vers;
> +    __u8 reserved;
> +    __u16 metadata_len;
> +    __aligned_u64 mask;
> +    __s32 fd; 
> +    __s32 pid;
> +};
> +.fi
> +.in
> +
> +.TP 15
> +.I event_len
> +This is the length of the data for the current event and the offset to the next
> +event in the buffer.
> +This length might be longer than the size of structure
> +.I fanotify_event_metadata.
> +Therefore it is recommended to use a larger buffer size when reading,
            ^
Add comma

> +e.g. 4096 bytes.

Change "e.g." to "for example,"

> +.TP
> +.I vers
> +The structures fanotify_event_metadata and fanotify_response have been changed
> +repeatedly. 

Have they? I don't know. But this statement is rather strong. Is it correct?
If it is true, it would be good to mention a few of the changes, and when
they occurred.

> +This field holds the version information about the structures.

"holds a version number for the structures"

> +It must be compared to
> +.B FANOTIFY_METADATA_VERSION
> +to verify that the structures at runtime match the structures at compile
> +time.
> +In case of a mismatch the fanotify file descriptor has to be closed.
                        ,
Comma

> +.TP
> +.I reserved
> +This field is not used.
> +.TP
> +.I metadata_len
> +This is the length of the structure.
> +The field was introduced to facilitate the implementation of optional headers
> +per event type.

To repeat a point I already made:

Are there any such optional headers so far? If not, then add a sentence to 
say so. If there are, mention an example.

> +.TP
> +.I mask
> +This is a bitmask describing the event.

Please use "bit mask" throughout.

> +.TP
> +.I fd
> +This is an open file descriptor for the object being accessed or
> +.B FAN_NOFD
> +if a queue overflow occurred.
> +The reading application is responsible for closing this file descriptor.

Maybe say

"for closing this file descriptor (if the value is other than FAN_NOFD)"

> +.TP
> +.I pid
> +This is the ID of the process that caused the event.
> +A program listening to fanotify events can compare this pid to the pid returned

s/pid/PID/g in previous line.

> +by
> +.BR getpid (2)
> +to detect if the event is caused by the listener itself or is due to a file
> +access by another program.
> +.PP
> +The bitmask in
> +.I mask
> +signals which events have occured for a single file system object.

"occurred"

> +More than one of the following flags can be set at once in the bitmask.

"One or more of the following flags may be set in the bit mask".

> +.TP
> +.B FAN_ACCESS
> +A file was accessed.
> +.TP
> +.B FAN_OPEN
> +A file was opened.
> +.TP
> +.B FAN_MODIFY
> +A file was modified.
> +.TP
> +.B FAN_CLOSE_WRITE
> +A writable file was closed.
> +.TP
> +.B FAN_CLOSE_NOWRITE
> +An read only file was closed.

s/An read only/A read-only/
(two changes)


> +.TP
> +.B FAN_Q_OVERFLOW
> +The event queue exceeded the limit of 16384 entries. This limit can be
> +overriden in the call to
> +.BR fanotify_init (2)
> +by setting flag

s/flag/the flag/

> +.BR FAN_UNLIMITED_QUEUE .
> +.TP
> +.B FAN_ACCESS_PERM
> +An application wants to access a file.

s/a file/the file/

But, what does "access a file" mean? How is it different from "open a 
file"? That needs to be explained. For example, FAN_ACCESS_PERM does 
not block open(), but does act as a gateway on at least the following:  
execve(2), read(2) (but not write(2)), read contents of a directory 
(getdents(2)?). There needs to be some kind of general statement here 
(or somewhere) about what the difference is between FAN_ACCESS_PERM 
and FAN_OPEN_PERM.

> +A decision has to be taken if the permission to access the file is granted.
> +.TP
> +.B FAN_OPEN_PERM
> +An application wants to open a file.

s/a file/the file/

> +A decision has to be taken if the permission to open the file is granted.
> +.TP
> +.B FAN_ONDIR
> +The event concerns a monitored directory.

I don't think this is correct. It looks to me like FAN_ONDIR is used
only as an input flag in fanotify_mark(). It isn't returned by read(). 
Please confirm.

> +.TP
> +.B FAN_EVENT_ON_CHILD
> +The event concerns the child of a monitored directory.

I don't think this is correct. It looks to me like FAN_EVENT_ON_CHILD 
is used only as an input flag in fanotify_mark(). It isn't returned by 
read(). Please confirm.

> +.PP
> +To check for any close event the following bitmask may be used:
                               ^
Add comma

> +.TP
> +.B FAN_CLOSE
> +A file was closed 
> +(FAN_CLOSE_WRITE | FAN_CLOSE_NOWRITE).
> +.PP
> +The following macros are provided to iterate over a buffer with fantify

Typo: "fantify"

> +event metadata.
> +.TP
> +.B FAN_EVENT_OK(meta, len)
> +This macro checks the remaining length
> +.I len
> +of the buffer
> +.I meta
> +against the length of the metadata structure and the
> +.I event_len
> +field of the first metadata structure in the buffer.
> +.TP
> +.B FAN_EVENT_NEXT(meta, len)
> +This macro lets the pointer

s/lets/sets/

> +.I meta
> +point to the next metadata structure using the length indicated in the

s/point/to point/
s/indicated/specified/.

> +.I event_len
> +field of the metadata structure and reduces the remaining length of the
> +buffer
> +.I len.

.IR len .

> +.PP
> +For permission events, the application must
> +.BR write (2)
> +a structure of the following form to the 
> +.B fanotify
> +file descriptor

s/$/:/

> +
> +.in +4n
> +.nf
> +struct fanotify_response {
> +        __s32 fd;
> +        __u32 response;
> +};
> +.fi
> +.in
> +
> +.TP 15
> +.I fd
> +This is the file descriptor from structure

s/structure/the structure/

> +.I fanotify_event_metadata.
> +.TP
> +.I response
> +This field contains the decision if the permission is granted.

"This field indicates whether or not permission is to be granmted."

> +It's value must be either

s/It's/Its/


> +.B FAN_ALLOW
> +to allow the file operation or
> +.B FAN_DENY
> +to deny the file operation.

Here, there needs to be text that explains what happens 
to the denied application.

> +.PP
> +To end listening, it is sufficient to
> +.BR close (2)
> +the fanotify file descriptor.
> +The open permission events will be set to allowed, and all resources will be

s/open/outstanding/

> +returned to the kernel.
> +.PP
> +The file 
> +.I /proc/<pid>/fdinfo/<fd>
> +contains information about fanotify marks for file descriptor fd of process
> +pid. See

       ^
New sentence, new source line.

> +.I Documentation/filesystems/proc.txt
> +for details.
> +.SH ERRORS
> +The following errors may occur when reading from the
> +.B fanotify
> +file descriptor:

Since EAGAIN, EFAULT, and EINTR are standard errors for read(),
I would omit them from this list. Instead, you could introduce the 
list with something like:

    In addition to the usual errors for read(2), the following errors
    can occur when reading from an fanotify file descriptor:
 
> +.TP
> +.B EAGAIN
> +A nonblocking call did not return any data.
> +.TP
> +.B EFAULT
> +The read buffer is outside of the accessible address space.
> +.TP
> +.B EINTR
> +The call was interrupted by a signal handler.
> +.TP
> +.B EINVAL
> +The buffer is too short to hold the event.
> +.PP
> +The following errors may occur when writing to the
> +.B fanotify
> +file descriptor:

See above. I'd omit EFAULT, here.

> +.TP
> +.B EFAULT
> +The write buffer is outside of the accessible address space.
> +.TP
> +.B EINVAL
> +Fanotify access permissions are not enabled or the value of

I do not understand this piece "Fanotify access permissions are not 
enabled". What does it mean?  (I think some rewriting is needed here.)

> +.I response
> +in the response structure is not valid.

> +.TP
> +.B ENOENT
> +The file descriptor
> +.I fd
> +in the response structure is not valid.
> +This might occur because the file was already deleted by another thread or
> +process.
> +.SH VERSIONS
> +The fanotify API was introduced in version 2.6.36 of the Linux kernel and
> +enabled in version 2.6.37. Fdinfo support was added in version 3.8.
> +.SH "CONFORMING TO"
> +The fanotify API is Linux-specific.
> +.SH NOTES
> +The notification is based on the kernel filesystem notification system
> +.B fsnotify.
> +.PP
> +To enable the fanotify API the following setting in the Kernel configuration is
> +needed:
> +CONFIG_FANOTIFY=y. For permission handling
> +CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y must be set.
> +.SH EXAMPLE
> +The following program demonstrates the usage of the
> +.B fanotify
> +API. It marks the mount passed as argument and waits for events of type
        ^
New sentence on new source line.

> +.B FAN_PERM_OPEN
> +and
> +.BR FAN_CLOSE_WRITE .
> +When a permission event arises a
                                 ^

Add comma

> +.B FAN_ALLOW
> +response is given.
> +.PP
> +The following output was recorded while editing file 
> +.IR /home/user/temp/notes .

But below, the directory is /home/zfsdt/temp/notes
Something needs to be fixed, either here, or below.
 
> +Before the file was opened a
                             ^
Add comma.

> +.B FAN_OPEN_PERM
> +event occurred.
> +After the file was closed a
                            ^
Add comma

> +.B FAN_CLOSE_WRITE
> +event occurred.
> +The example program ended when hitting the enter key.
> +.SS Example output
> +.in +4n
> +.nf
> +# ./fanotify_example /home
> +Press enter key to terminate.
> +Listening for events.
> +FAN_OPEN_PERM: File /home/zfsdt/temp/notes
> +FAN_CLOSE_WRITE: File /home/zfsdt/temp/notes
> +
> +Listening for events stopped.
> +.fi
> +.in

A lot of my comments from the last review of this program seem 
_not_ to have been taken into account. Could you please also
review previous mails.

> +.SS Program source
> +.nf
> +#define _GNU_SOURCE // needed for O_LARGEFILE
> +#include <assert.h>
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <limits.h>
> +#include <poll.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <sys/fanotify.h>
> +#include <unistd.h>
> +
> +// Handle available events.
> +static void
> +handle_events(int fd)
> +{
> +    const struct fanotify_event_metadata *metadata;
> +    char buf[4096];
> +    int len;

len should be ssize_t.

> +    char path[PATH_MAX];
> +    int path_len;

path_len should be ssize_t.

> +    struct fanotify_response response;
> +
> +    // Loop while events can be read from fanotify file descriptor.

Please change all comments to

    /* ... */

(It's the norm in man pages.)

And please ensure an empty line follows all standalone comments


> +    for(;;) {
> +
> +        // Read next events.
> +        len = read(fd, (void *) &buf, sizeof(buf));
> +        if (len > 0) {

Please simplify this logic; there's no need to indent this long block. 
Make it:

            len = read()
            if (len <= 0)
                break;

            metadata = (struct fanotify_event_metadata *) buf;
            ....

> +
> +            // Point to the first event in the buffer.
> +            metadata = (struct fanotify_event_metadata *) buf;
> +
> +            // Loop over all events in the buffer.
> +            while (FAN_EVENT_OK(metadata, len)) {
> +
> +                // Assure that run time and compile time structures match.
> +                assert(metadata\->vers == FANOTIFY_METADATA_VERSION);

Drop the assert(); use real if() checks and error handling.

> +                // Check event contains a file descriptor.
> +                if (metadata\->fd >= 0) {
> +
> +                    // Handle open permission event.
> +                    if (metadata\->mask & FAN_OPEN_PERM) {
> +                        printf("FAN_OPEN_PERM: ");
> +
> +                        // Allow file to be opened.
> +                        response.fd = metadata\->fd;
> +                        response.response = FAN_ALLOW;
> +                        write(fd, &response, sizeof(
> +                                  struct fanotify_response));
> +                    }
> +
> +                    // Handle closing of writable file event.
> +                    if (metadata\->mask & FAN_CLOSE_WRITE) {
> +                        printf("FAN_CLOSE_WRITE: ");
> +                    }
> +
> +                    // Determine path of the file accessed.
> +                    sprintf(path, "/proc/self/fd/%d", metadata\->fd);
> +                    path_len = readlink(path, path, sizeof(path) \- 1);
> +
> +                    // Write path.
> +                    if (path_len > 0) {
> +                        path[path_len] = '\\0';
> +                        printf("File %s", path);
> +                    }

The above code is broken. If readlink() returns -1, not only is
the error not diagnosed, but printf() will display bogus info.

For clarity, I suggest using two variables, instead of using 'path'
as both input and output in the readlink() call. Something like:

            snprintf(procfd_path, sizeof(procfd_path) - 1,
                    "/proc/self/fd/%d", md->fd);
            path_len = readlink(procfd_path, target, sizeof(target) - 1);
            if (path_len == -1) {
                perror("readlink");
                exit(EXIT_FAILURE);
	    }
            target[path_len] = '\0';

> +
> +                    // Close the file descriptor of the event.
> +                    close(metadata\->fd);
> +                    printf("\\n");
> +                }
> +
> +                // Forward pointer to next event.
> +                metadata = FAN_EVENT_NEXT(metadata, len);
> +            }
> +        } else {
> +
> +            // No more events are available.
> +            break;
> +        }
> +    }
> +}
> +
> +int
> +main(int argc, char *argv[])
> +{
> +    char buf;
> +    int fd, ret;
> +    nfds_t nfds;
> +    struct pollfd fds[2];
> +
> +    // Check mount point is supplied.
> +    if (argc != 2) {
> +        printf("Usage: %s MOUNT\\n", argv[0]);
> +        return EXIT_FAILURE;
> +    }
> +
> +    printf("Press enter key to terminate.\\n");
> +
> +    // Create the file descriptor for accessing the fanotify API.
> +    fd = fanotify_init(FAN_CLOEXEC | FAN_CLASS_CONTENT | FAN_NONBLOCK,
> +                       O_RDONLY | O_LARGEFILE);
> +    if (fd == \-1) {
> +        perror("fanotify_init");
> +        return EXIT_FAILURE;
> +    }
> +
> +    // Mark the mount for
> +    // \- permission events before opening files
> +    // \- notification events after closing a write enabled file descriptor.
> +    if (fanotify_mark(fd, FAN_MARK_ADD | FAN_MARK_MOUNT,
> +                      FAN_OPEN_PERM | FAN_CLOSE_WRITE, FAN_NOFD,

Why 'FAN_NOFD' here?

> +                      argv[1]) == \-1) {
> +        perror("fanotify_mark");
> +        close(fd);
> +        return EXIT_FAILURE;
> +    }
> +
> +    // Prepare for polling.
> +    nfds = 2;
> +    // Console input.
> +    fds[0].fd = STDIN_FILENO;
> +    fds[0].events = POLLIN;
> +    fds[0].revents = 0;
> +    // Fanotify input.
> +    fds[1].fd = fd;
> +    fds[1].events = POLLIN;
> +    fds[1].revents = 0;
> +
> +    // This is the loop to wait for incoming events.
> +    printf("Listening for events.\\n");
> +    for(;;) {
> +        ret = poll(fds, nfds, \-1);
> +        if (ret > 0) {
> +            if (fds[0].revents & POLLIN) {
> +                // Console input is available. Empty stdin and quit.
> +                while(read(STDIN_FILENO, &buf, 1) > 0 && buf != '\\n');

Too easy to misread. Make it

    while(read(STDIN_FILENO, &buf, 1) > 0 && buf != '\\n')
        ;

or better:

    while(read(STDIN_FILENO, &buf, 1) > 0 && buf != '\\n')
       continue;


> +                break;
> +            }
> +            if (fds[1].revents & POLLIN) {
> +                // Fanotify events are available.
> +                handle_events(fd);
> +                fds[1].revents = 0;
> +            }
> +        } else if (ret == \-1 && errno != EINTR) {
> +            perror("poll");
> +            break;
> +        }
> +    }
> +
> +    // Close fanotify file descriptor.
> +    close(fd);
> +    printf("Listening for events stopped.\\n");
> +    return EXIT_SUCCESS;
> +}
> +.fi
> +.SH "SEE ALSO"
> +.ad l
> +.BR fanotify_init (2),
> +.BR fanotify_mark (2),
> +.BR inotify (7)
> 


> diff --git a/man2/fanotify_init.2 b/man2/fanotify_init.2
> new file mode 100644
> index 0000000..888c20d
> --- /dev/null
> +++ b/man2/fanotify_init.2
> @@ -0,0 +1,208 @@
> +.\" Copyright (C) 2013, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> +.\" 
> +.\" %%%LICENSE_START(VERBATIM)
> +.\" Permission is granted to make and distribute verbatim copies of this
> +.\" manual provided the copyright notice and this permission notice are
> +.\" preserved on all copies.
> +.\"
> +.\" Permission is granted to copy and distribute modified versions of
> +.\" this manual under the conditions for verbatim copying, provided that
> +.\" the entire resulting derived work is distributed under the terms of
> +.\" a permission notice identical to this one.
> +.\"
> +.\" Since the Linux kernel and libraries are constantly changing, this
> +.\" manual page may be incorrect or out-of-date.  The author(s) assume.
> +.\" no responsibility for errors or omissions, or for damages resulting.
> +.\" from the use of the information contained herein.  The author(s) may.
> +.\" not have taken the same level of care in the production of this.
> +.\" manual, which is licensed free of charge, as they might when working.
> +.\" professionally.
> +.\"
> +.\" Formatted or processed versions of this manual, if unaccompanied by
> +.\" the source, must acknowledge the copyright and authors of this work.
> +.\" %%%LICENSE_END
> +.TH FANOTIFY_INIT 2 2014-03-22 "Linux" "Linux Programmer's Manual"
> +.SH NAME
> +fanotify_init \- create and initialize fanotify group
> +.SH SYNOPSIS
> +.B #include <fcntl.h>
> +.br
> +.B #include <sys/fanotify.h>
> +.sp
> +.BI "int fanotify_init(unsigned int " flags ", unsigned int " event_f_flags );
> +.SH DESCRIPTION
> +For an overview of the fanotify API, see
> +.BR fanotify (7).
> +.PP
> +.BR fanotify_init()

Add space before "()"

> +initializes a new fanotify group and returns a file descriptor for the event
> +queue.

s/event queue/event queue associated with the group/

> +.PP
> +The file descriptor is used in calls to
> +.BR fanotify_mark (2)
> +to define for which files, directories, or mounts fanotify events shall be
> +created.

Make it: 

to specify the files, directories, and mounts for which fanotify events 
shall be created.

> +These events are received by reading from the file descriptor.
> +Some events only inform that a file has been accessed.

Make it:
Some events are only informative, indicating that a file a has been accessed.

> +Other events can be used to control if another application may access a file.
> +Decisions upon the permission is granted by writing to the file descriptor.

s/upon/about/
s/is granted/are made/

> +An overview is provided in
> +.BR fanotify (7).

Probably can drop the preceding sentence since it repeats the point made at 
the start?

> +.PP
> +Multiple programs may be using the fanotify interface at the same time to
> +monitor the same files. 
> +Yet the number of fanotify groups per user is limited to 128.

s/Yet/In the current implementation,/

> +This value cannot be overridden.

s/value/limit/

I find the bracketed piece ([[[[...]]]]) below quite unclear. After
reading, I still do not understand what is going on. In particular,
it is not at all clear what the difference between FAN_CLASS_PRE_CONTENT
and FAN_CLASS_CONTENT is. Could you expand/clarify?

Also, the term 'priority level' could do with some clarification.

Also, you split the discussion of 'flags' over two places. It would be 
easier to read if all of the flags were discussed in contiguous 
paragraphs. I would rephrase the discussion like this:

    The flags argument specifies options that control the behavior of
    the call. This argument should include exactly one of the following, 
    which set the priority level <blah blah>:


       FAN_CLASS_PRE_CONTENT

       FAN_CLASS_CONTENT

       FAN_CLASS_NOTIF

           (And it looks as though NOTIF is the default, since it is zero.
           Maybe say this?)

[[[[

> +.PP
> +By indicating in
> +.I flags
> +which kind of operations will be executed a logical sequence can be defined
> +in which events are forwarded to the listeners. The following bitmasks define
> +the kind of usage.

(By the way, the FAN_CLASS constants are _not_ bit masks, see the comments in
include/uapi/linux/fanotify.h )

> +Only one of them may be used when calling
> +.BR fanotify_init ().
> +.TP
> +.B FAN_CLASS_PRE_CONTENT
> +This priority level allows the receipt of events notifying that a file has been
> +accessed and events for permission decisions if a file may be accessed.
> +It is intended for event listeners that need to access files before they
> +contain their final data.
> +This may be used hierarchical storage managers.

s/used/used by/

> +.TP
> +.B FAN_CLASS_CONTENT
> +This priority level allows the receipt of events notifying that a file has been
> +accessed and events for permission decisions if a file may be accessed.
> +It is intended for event listeners that need to access files when they already
> +contain their final content.
> +This may be used by malware detection programs.
> +.TP
> +.B FAN_CLASS_NOTIF
> +This sets a priority level which only allows the receipt of events notifying
> +that a file has been accessed.
> +Permission decisions before the file is accessed are not possible.
> +.PP

]]]]

> +Listeners with different priority levels will receive events in the sequence
> +.BR FAN_CLASS_PRE_CONTENT ,
> +.BR FAN_CLASS_CONTENT ,
> +.BR FAN_CLASS_NOTIF .
> +The call sequence among listeners of the same priority level is undefined.
> +.PP
> +Calling
> +.BR fanotify_init()
> +requires the
> +.B CAP_SYS_ADMIN
> +capability.
> +This constraint might be relaxed in future versions of the API.
> +Hence additional local capability checks have been implemented as indicated

s/Hence/Therefore,/

> +below.
> +.PP
> +.IR flags
> +defines the behavior of the file descriptor.
> +It is a bitmask composed of the following values:
> +.TP
> +.B FAN_CLOEXEC
> +This flag sets the close-on-exec flag
> +.RB ( FD_CLOEXEC )
> +on the new file descriptor.
> +When calling
> +.BR execve (2)
> +the inherited file descriptor of the child process will be closed.
> +See the description of the
> +.B O_CLOEXEC
> +flag in
> +.BR open (2).
> +.TP
> +.B FAN_NONBLOCK
> +This flag enables the non-blocking flag
> +.RB ( O_NONBLOCK )
> +for the file descriptor.
> +Reading from the file descriptor will not block.
> +Instead if no data is available in a call to
          ^
Comma

> +.BR read (2)
> +an error
> +.B EAGAIN
> +will occur.
> +.TP
> +.B FAN_CLASS_PRE_CONTENT
> +See above.
> +.TP
> +.B FAN_CLASS_CONTENT
> +See above.
> +.TP
> +.B FAN_CLASS_NOTIF
> +See above.
> +.TP
> +.B FAN_UNLIMITED_QUEUE
> +This flag removes the limit of 16384 events on the size of the event queue.
> +It requires the
> +.B CAP_SYS_ADMIN
> +capability.
> +.TP
> +.B FAN_UNLIMITED_MARKS
> +This flag removes the limit of 8192 marks on the number of marks.
> +It requires the
> +.B CAP_SYS_ADMIN
> +capability.
> +.PP
> +.IR event_f_flags
> +This parameter defines the file flags, with which file descriptors for fanotify

Start this sentence as

The event_f_flags argument defines....

And s/parameter/argument/ throughout. (This is the norm for man-pages.)

And:
s/falgs,/flags/

> +events shall be created.
> +For explanations of possible values see parameter
                                      ^
comma

> +.I flags
> +of the 
> +.BR open (2)
> +system call.
> +Useful values are

s/$/:/

> +.TP
> +.B O_RDONLY
> +This value allows only read access.
> +.TP
> +.B O_WRONLY
> +This value allows only write access.
> +.TP
> +.B O_RDWR
> +This value allows read and write access.
> +.TP
> +.B O_CLOEXEC
> +This flag enables close-on-exec.
> +.TP
> +.B O_LARGEFILE
> +This flag enables support files exceeding 2 GB.
> +Failing to set this flag will result in an
> +.B EOVERFLOW
> +error when trying to open a large file which is monitored by a fanotify group
> +on a 32-bit system.
> +.SH RETURN VALUE
> +On success

s/$/,/

> +.BR fanotify_init ()
> +returns a new file descriptor.
> +In case of an error \-1 is returned, and
                      ^
Comma

> +.I errno
> +is set to indicate the error.
> +.SH ERRORS
> +.TP
> +.B EINVAL
> +An invalid value was passed in
> +.IR flags .
> +.B FAN_ALL_INIT_FLAGS
> +defines all allowable bits.
> +.TP
> +.B EMFILE
> +The number of fanotify groups of the user exceeds 128.
> +.TP
> +.B ENOMEM
> +The allocation of memory for the notification group failed. 
> +.TP
> +.B EPERM
> +The operation is not permitted because capability
> +.B CAP_SYS_ADMIN
> +is missing.
> +.SH VERSIONS
> +.BR fanotify_init ()
> +was introduced in version 2.6.36 of the Linux kernel and enabled in version
> +2.6.37.
> +.SH "CONFORMING TO"
> +This system call is Linux-specific.
> +.SH "SEE ALSO"
> +.BR fanotify_mark (2),
> +.BR fanotify (7)
> diff --git a/man2/fanotify_mark.2 b/man2/fanotify_mark.2
> new file mode 100644
> index 0000000..b4617c8
> --- /dev/null
> +++ b/man2/fanotify_mark.2
> @@ -0,0 +1,239 @@
> +.\" Copyright (C) 2013,  Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> +.\" 
> +.\" %%%LICENSE_START(VERBATIM)
> +.\" Permission is granted to make and distribute verbatim copies of this
> +.\" manual provided the copyright notice and this permission notice are
> +.\" preserved on all copies.
> +.\"
> +.\" Permission is granted to copy and distribute modified versions of
> +.\" this manual under the conditions for verbatim copying, provided that
> +.\" the entire resulting derived work is distributed under the terms of
> +.\" a permission notice identical to this one.
> +.\"
> +.\" Since the Linux kernel and libraries are constantly changing, this
> +.\" manual page may be incorrect or out-of-date.  The author(s) assume.
> +.\" no responsibility for errors or omissions, or for damages resulting.
> +.\" from the use of the information contained herein.  The author(s) may.
> +.\" not have taken the same level of care in the production of this.
> +.\" manual, which is licensed free of charge, as they might when working.
> +.\" professionally.
> +.\"
> +.\" Formatted or processed versions of this manual, if unaccompanied by
> +.\" the source, must acknowledge the copyright and authors of this work.
> +.\" %%%LICENSE_END
> +.TH FANOTIFY_MARK 2 2014-03-22 "Linux" "Linux Programmer's Manual"
> +.SH NAME
> +fanotify_mark \- add, remove, or modify a fanotify mark on a filesystem
> +object.

Remove '.'

> +.SH SYNOPSIS
> +.nf
> +.B #include <sys/fanotify.h>
> +.sp
> +.BI "int fanotify_mark (int " fanotify_fd ", unsigned int " flags ,

Remove space before '('

> +.BI "                   uint64_t " mask ", int " dirfd ,
> +.BI "                   const char *" pathname );
> +.fi
> +.SH DESCRIPTION
> +For an overview of the fanotify API, see
> +.BR fanotify (7).
> +.PP
> +.BR fanotify_mark (2)
> +adds, removes, or modifies a fanotify mark on a filesystem.
> +.PP
> +.I fanotify_fd
> +is the file descriptor returned by

The
+.I fanotify_fd
argument is the file descriptor returned by

> +.BR fanotify_init (2).
> +.PP
> +.I flags
> +is a bitmask describing the modification to perform.
> +It is composed of the following values:

At the end of this list, you say that only one of FAN_MARK_ADD, 
FAN_MARK_REMOVE, or FAN_MARK_FLUSH can be used. I'd put that 
information at the front, and restructure the discussion like this:

[[
.I flags 
is a bit mask describing the modifications to perform.
It must include exactly one of the following

FAN_MARK_ADD
    ...
FAN_MARK_REMOVE
    ...
FAN_MARK_FLUSH
    ...

If none of the above is specified, or more than one is specified, 
the call fails with the error
.BR EINVAL .

In addition,
.I flags
may contain zero or more of the following:
...
]]

> +.TP
> +.B FAN_MARK_ADD
> +The events in parameter
> +.I mask
> +will be added to the marke mask (or to the ignore mask).

"marke" ==> "mark"

> +.I mask
> +must be nonempty or the error
> +.B EINVAL
> +will occur.
> +.TP
> +.B FAN_MARK_REMOVE
> +The events in paramter
> +.I mask
> +will be removed from the mark mask (or from the ignore mask).
> +.I mask
> +must be nonempty or the error
> +.B EINVAL
> +will occur.
> +.TP
> +.B FAN_MARK_DONT_FOLLOW
> +Symbolic links shall not be followed.
> +.TP
> +.B FAN_MARK_ONLYDIR
> +If the path to be marked is not a directory the error

I think it might be better to say

"The filesystem object to be marked..."

For example, if pathname is NULL, then there is no "pathname" involved. 
Instead, we are using the file descriptor 'dirfd' to identify the object
to be marked.

> +.B ENOTDIR
> +shall be raised.

Is this error listed in the ERRORS section?

> +.TP
> +.B FAN_MARK_MOUNT
> +The path indicates a mount point to be marked.
> +If the path is not itself a mount point the mount point containing the path
> +will be marked.
> +All directories, subdirectories, and the contained files of the mount point
> +will be monitored.
> +.TP
> +.B FAN_MARK_IGNORED_MASK
> +The events in parameter
> +.I mask
> +shall be added to or removed from the ignore mask.
> +.TP
> +.B FAN_MARK_IGNORED_SURV_MODIFY
> +The ignore mask shall survive modify events.
> +If this flag is not set, the ignore mask is cleared, if a modify event occurs
> +for the fanotify group.
> +.TP
> +.B FAN_MARK_FLUSH
> +Remove all events from the whole group.

I want to be clear here. This means erase the entire set of marks
for the group associated with 'fanotify_fd', right. In that case,
s/events/marks/ above.

And, you need to explain the requirements for the other arguments:

Is 'mask' ignored? (Looks like it is.)

What about other flags in 'flags'? Are they ignored?

What about 'dirfd' and 'pathname'? It looks like they are NOT
ignored. (And this smells a lot like an API design bug.) For example,
specifying a nonexistent 'pathname' with FAN_MARK_FLUSH gives ENOENT,
and specifying 'pathname" as NULL with 'dirfd' as AT_FDCWD gives EBADF.

fanotify_mark(fan_fd, FAN_MARK_FLUSH, 0, 0, NULL);
as shown here
http://git.infradead.org/users/eparis/fanotify-example.git/blob/HEAD:/fanotify.c
works, but only fortuitously, because 'dirfd' refers to STDIN_FILENO. 
However, if fails if FD 0 is closed, or if FAN_MARK_ONLYDIR is specified 
in 'flags'

Something should be said about this in the BUGS section of either fanotify(7) 
or fanotify_mark(2).

> +.PP
> +Only one of
> +.BR FAN_MARK_ADD ,
> +.BR FAN_MARK_REMOVE ,
> +or
> +.B FAN_MARK_FLUSH
> +can be used.
> +Failure to do so results in the error
> +.BR EINVAL .
> +.PP
> +.I mask
> +defines which events shall be listened to (or which shall be ignored).
> +It is a bitmask composed of the following values:

There is some confusion in the following list. Various flags below
are only *returned* by read() on the FAN FD. They can't be set during
fanotify_mark().

Also, the whole list is worded strangely. Essentially, you've taken
the list from fanotify(7), but the wording there relates to events
that have occurred, whereas the list below should be talking about 
the events the application wants to monitor. See what I mean?

> +.TP
> +.B FAN_ACCESS
> +A file was accessed (read).

    ==> Report file access events (read)

> +.TP
> +.B FAN_MODIFY
> +A file was modified (write).

    Report file modification events (write).

And so on...

> +.TP
> +.B FAN_CLOSE_WRITE
> +A writable file was closed.
> +.TP
> +.B FAN_CLOSE_NOWRITE
> +An readonly file was closed.
> +.TP
> +.B FAN_OPEN
> +A file was opened.
> +.TP
> +.B FAN_Q_OVERFLOW
> +The event queue overflowed.

This isn't correct. One can't specify FAN_Q_OVERFLOW in 'mask'
(EINVAL)

> +.TP
> +.B FAN_OPEN_PERM
> +A file open permission was requested.
> +.TP
> +.B FAN_ACCESS_PERM
> +An access permission for a file was requested.
> +.TP
> +.B FAN_ONDIR
> +The event occurred against a directory.

Above is an example of what I mean by strange wording.
This should say something like:

    Monitor events on a directory

> +.TP
> +.B FAN_EVENT_ON_CHILD
> +An event for a child of a monitored directory occurred.

Above is an example of what I mean by strange wording.
This should, I think, say something like:

     Report events for children of a subdirectory.

> +.PP
> +The following composed value is defined
> +.TP
> +.B FAN_CLOSE
> +A file was closed (FAN_CLOSE_WRITE | FAN_CLOSE_NOWRITE).
> +.PP
> +The path to be marked is determined by the file descriptor
> +.I dirfd
> +and the pathname specified in
> +.IR pathname :
> +.IP * 3
> +If 
> +.I pathname
> +is NULL

s/$/,/

> +.I dirfd
> +defines the path to be marked.

Here, I think you need to say that 'dirfd' can refer to any type of 
file, not just a directory. (But see nu next comment 
below.)

> +.IP *
> +If
> +.I pathname
> +is NULL and
          ^
Comma
> +.I dirfd
> +takes the special value
> +.BR AT_FDCWD ,
> +the current working directory is to be marked.
> +.IP *
> +If
> +.I pathname
> +is absolute it defines the path to be marked, and
              ^
Comma

> +.I dirfd
> +is ignored.
> +.IP *
> +If
> +.I pathname
> +is relative, it defines a path relative to the path indicated by the file
> +descriptor in
> +.I dirfd
> +to be marked.

(See my comment above.) Here, I imagine that 'dirfd' must refer to a 
directory (as is the case for openat(). for example). If so, that 
needs to be explained here.

> +.IP *
> +If
> +.I pathname
> +is relative and
> +.I dirfd
> +takes the special value
> +.BR AT_FDCWD ,
> +it defines a path relative to the current working directory to be marked.

s/it/pathname/

> +.SH RETURN VALUE
> +On success

s/$/,/

> +.BR fanotify_mark ()
> +returns 0.
> +In case of an error \-1 is returned, and
                      ^
comma

> +.I errno
> +is set to indicate the error.
> +.SH ERRORS
> +.TP
> +.B EBADF
> +An invalid file descriptor was passed in
> +.IR fanotify_fd .
> +.TP
> +.B EINVAL
> +An invalid value was passed in
> +.IR flags
> +or
> +.IR mask ,
> +or
> +.I fanotify_fd
> +was not a fanotify file descriptor.
> +.TP
> +.B ENOENT
> +The directory indicated by
> +.IR pathname
> +does not exist.

'pathname' doen't need to be a directory...

> +This error also occurs when trying to remove a mark from a directory or mount
> +which is not marked.

And again, can't the pathname also be for a file?

I'd write that last piece as a separate list entry:

    .TP
    .B ENOENT
    Tried to remove a mark from an object that is not marked.

> +.TP
> +.B ENOMEM
> +The necessory memory could not be allocated.

necessary

> +.TP
> +.B ENOSPC
> +The number of marks exceeds the limit of 8192 and
> +.B FAN_UNLIMITED_MARKS
> +was not specified in the call to
> +.BR fanotify_init (2).
> +.TP
> +.B ENOTDIR
> +.I flags
> +contains
> +.B FAN_MARK_ONLYDIR
> +and
> +.I dirfd
> +does not point to a directory and
> +.I pathname
> +is NULL.

What about the case where *pathname* is not a directory? 

I suggest rewriting as follows:

    flags contains FAN_MARK_ONLYDIR, but the object specified by
    pathname and dirfd is not a directory.

> +.SH VERSIONS
> +.BR fanotify_mark ()
> +was introduced in version 2.6.36 of the Linux kernel and enabled in version
> +2.6.37.
> +.SH "CONFORMING TO"
> +This system call is Linux-specific.
> +.SH "SEE ALSO"
> +.BR fanotify_init (2),
> +.BR fanotify (7)
> diff --git a/man7/fanotify.7 b/man7/fanotify.7
> new file mode 100644
> index 0000000..e30882d


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
