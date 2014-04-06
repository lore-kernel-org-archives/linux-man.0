From: xypron.glpk-Mmb7MZpHnFY@public.gmane.org
Subject: =?UTF-8?q?=5BPATCH=200/1=5D=20Manpages=20for=20the=20fanotify=20API?=
Date: Sun,  6 Apr 2014 02:01:08 +0200
Message-ID: <1396742468-4752-1-git-send-email-xypron.glpk@gmx.de>
References: <5330A257.9080100@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5330A257.9080100-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, jack-AlSwsSmVLrQ@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

=46rom: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>

Hello Michael,

please, find the answer to your most prominent questions
in this mail.

I put the patch into a separate mail.

Best regards

Heinrich Schuchardt

=3D=3D

 >> What permissions does one need on a file to watch it with
 >> fanotify? That should be documented.
The only permission needed is CAP_SYS_ADMIN and read permission
on the mount, directory, or file marked.

=3D=3D

 >> The pages say nothing about merging of events. Merging can happen
 >> for non-permission events, but not for permission events.
 >> Something needs to be said about this, probably in fanotify(7)
 >> If you are unsure of what I mean, just add the following in
 >> fanotify(7)

You missed this sentence: "The bitmask in mask signals which events
have occured for a single file system object. More than one of the
following flags can be set at once in the bitmask."

Jan Kara wrote, that the only guarantee given is, that no two
permission events will be merged.

I reworked fanotify.7.

=3D=3D

 >> The discussion of monitoring of directories could be clearer.
 >> To begin with, it wasn't immediately obvious from reading the
 >> page whether one could monitor children of a directory. See the
 >> text in fanotify_mark.2 for FAN_MARK_MOUNT.  The discussion of
 >> FAN_ONDIR/FAN_EVENT_ON_CHILD should say somethingsimilar, noting
 >> that FAN_ONDIR on its own gives just monitoring of directories;
 >> to monitor children you need  FAN_ONDIR | FAN_EVENT_ON_CHILD.
=46or monitoring children FAN_ONDIR is not needed.

 >> And some questions. If I monitor a directory ("xxx") and its
 >> children, creating, modifying, and deleting files in that directory
 >> generates events as I'd expect. But, if I create a subdirectory
 >> ("xxx/yyy") in that directory, it does not generate an event, and
 >> creating objects in that subdirectory also does not generate events
 >> (i.e., unlike with mount points, monitoring directories is not trul=
y
 >> recursive). Are both of these points correct? If yes, they need
 >> to be documented in the man page. (rmdir() of the subdirectory
 >> also seems not to generate an event.)
Not all fsnotify events are passed to fanotify. Some of the missing
events are:
=46S_MOVED_FROM   0x00000040  /* File was moved from X */
=46S_MOVED_TO     0x00000080  /* File was moved to Y */
=46S_CREATE       0x00000100  /* Subfile was created */
=46S_DELETE       0x00000200  /* Subfile was deleted */
=46S_DELETE_SELF  0x00000400  /* Self was deleted */
=46S_MOVE_SELF    0x00000800  /* Self was moved */
Cf. http://lkml.iu.edu/hypermail/linux/kernel/0907.3/00243.html

I added to fanotify.7
Currently only a limited set of events is supported.
Up to now there is no support for create, delete, and move events.

=3D=3D

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

=3D=3D

 >> Somewhere, this detail about permission events should be made
 >> clearer:
 >>
 >> * Can only set permission events if FAN_CLASS_PRE_CONTENT or
 >>   FAN_CLASS_CONTENT (not FAN_CLASS_CONTENT) was used to create
 >>   FAN fd. (EINVAL)
=46ixed in fanotify_init.2

=3D=3D

 >> I asked this earlier (in a different wording), but it seems not to
 >> have been addressed:
 >>
 >>    What happens if the application hits its file descriptor limit
 >>    (RLIMIT_NOFILES) when handling read()s from the FAN FD? (EMFILE)=
=2E
 >>
 >> This needs to be covered under the errors for read(2).
When diving deeper into the code EMFILE can be found in get_unusedfd.
=46IXED in fanotify.7

 >> And now I think of a related question: what if we hit the system-wi=
de
 >> limit on the number of open files (/proc/sys/fs/file-max)? (I suspe=
ct
 >> ENFILE.)
I could not verify this. But I guess you can reproduce all error codes
of open(2) in some part of the fanotify API.

 >> And yet another related question: what if the file in question
 >> is being executed? In this case, we can't get an ETXTBUSY from read=
().
Do you mean ETXTBSY? I could observe that read creates this error when
receiving an event for an executing file and fanotify_init was called w=
ith
O_RDWR.
=46ixed in fanotify.7

=3D=3D

 >> I notice that the FDs returned by read()s from the FAN FD have the
 >> FMODE_NONOTIFY flag (fcntl(F_GETFL)) flag set. If you know what tha=
t's
 >> about, it would be good to say something about. But, if not, do not
 >> worry--just place a FIXME in the page source of fanotify(7)

=46ixed in fanotify.7
If the listener accesses the file through the file descriptor provided
no additional events are created.

=3D=3D

 >> It all depends how you pronounce the name, but I assume "F-A-notify=
"
 >> and so I'd always write it as "an fanotify" (and in multiple places=
 below).

No indication has been given by Eric Paris that the first letters of fa=
notify
are an abbreviation, so I think of fanotify as a proper name pronounced
[f=C3=A6noutifai].
Cf. http://lkml.iu.edu/hypermail/linux/kernel/0907.3/00243.html

=3D=3D

 >> I'm still a little doubtful about this. How have you verified that
 >> O_LARGEFILE  is required (or where did you get the info)?
I tested on 32bit and it is definitely needed there.

=3D=3D

 >> +    // Mark the mount for
 >> >+    // \- permission events before opening files
 >> >+    // \- notification events after closing a write enabled file =
descriptor.
 >> >+    if (fanotify_mark(fd, FAN_MARK_ADD | FAN_MARK_MOUNT,
 >> >+                      FAN_OPEN_PERM | FAN_CLOSE_WRITE, FAN_NOFD,
> Why 'FAN_NOFD' here?
>
 >> >+                      argv[1]) =3D=3D \-1) {
 >> >+        perror("fanotify_mark");
 >> >+        close(fd);
 >> >+        return EXIT_FAILURE;
 >> >+    }

As described in fanotify_mark(2) the value of dfd is irrelevant if path=
name is not NULL.

=46AN_NOFD takes the value -1, which no file descriptor ever can have.

I changed this to -1 now.

=3D=3D

 >> Having these two types of masks allows a mount point or directory t=
o be
 >> marked for receiving events while at the same time ignoring events =
for a
 >> subdirectory under that mount point or directory.
This would be incomplete. Files and directories can be ignored.
I partially adopted you wording in fanotify.7

=3D=3D
 >>> The structures fanotify_event_metadata and fanotify_response have =
been
 >>> changed repeatedly.

 >> Have they? I don't know. But this statement is rather strong. Is it=
 correct?
 >> If it is true, it would be good to mention a few of the changes, an=
d when
 >> they occurred.
In the Git log you will find at least 4 different version. With fields =
added
and removed, alignment changed, and fieldtype changed. The last change =
was in
 2.6.37. I removed the sentence with repeatedly. It is sufficient to in=
dicate
that the value of the field should be checked.

=3D=3D


 >> I don't think this is correct. It looks to me like FAN_ONDIR is use=
d
 >> only as an input flag in fanotify_mark(). It isn't returned by read=
().
 >> Please confirm.
You are right.
=46ixed in fanotify.7

=3D=3D

 >> I don't think this is correct. It looks to me like FAN_EVENT_ON_CHI=
LD
 >> is used only as an input flag in fanotify_mark(). It isn't returned=
 by
 >> read(). Please confirm.

You are right.
=46ixed in fanotify.7

=3D=3D
 >> Here, there needs to be text that explains what happens
 >> to the denied application.
If access has been denied the requesting application call will receive =
an error
EPERM.

=3D=3D

 >> I do not understand this piece "Fanotify access permissions are not
 >> enabled". What does it mean?  (I think some rewriting is needed her=
e.)
=2E.. in the Kernel configuration ...
=46ixed in fanotify.7

=3D=3D

=46AN_ACCESS_PERM
The name is misleading. The permission check is done before executing a=
 file
or listing a directory.


Heinrich Schuchardt (1):
  Manpages for the fanotify API

 man2/fanotify_init.2 |  201 ++++++++++++++++++
 man2/fanotify_mark.2 |  260 +++++++++++++++++++++++
 man7/fanotify.7      |  576 ++++++++++++++++++++++++++++++++++++++++++=
++++++++
 man7/inotify.7       |    1 +
 4 files changed, 1038 insertions(+)
 create mode 100644 man2/fanotify_init.2
 create mode 100644 man2/fanotify_mark.2
 create mode 100644 man7/fanotify.7

--=20
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
