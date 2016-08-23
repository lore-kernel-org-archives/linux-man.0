From: enh <enh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: CLONE_FILES description confusing
Date: Tue, 23 Aug 2016 15:19:37 -0700
Message-ID: <CAJgzZopmS1ph4G4zMu-_chLjsyE4CLnZiuOPqXBC=vdUE9R96w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

       CLONE_FILES (since Linux 2.0)
              If CLONE_FILES is set, the calling process and the child proc=
ess
              share  the same file descriptor table.  Any file descriptor c=
re=E2=80=90
              ated by the calling process or by  the  child  process  is  a=
lso
              valid  in the other process.  Similarly, if one of the proces=
ses
              closes a file descriptor, or changes its associated flags (us=
ing
              the  fcntl(2)  F_SETFD  operation),  the  other  process is a=
lso
              affected.

this is fine.

              If CLONE_FILES is not set, the child process inherits a copy =
 of
              all  file  descriptors opened in the calling process at the t=
ime
              of clone().  (The duplicated file descriptors in the child re=
fer
              to  the  same open file descriptions (see open(2)) as the cor=
re=E2=80=90
              sponding file descriptors in the calling  process.)   Subsequ=
ent
              operations  that  open or close file descriptors, or change f=
ile
              descriptor flags, performed by either the calling process or =
the
              child process do not affect the other process.

this is strictly correct, but (having just had to explain what this
descriptor/description distinction actually means in practice here) i
think it would be helpful to explicitly mention that changes to the
file offset or file status flags in one process *does* affect the
other process.

less important, but another suggestion would be that maybe we should
also explicitly say that "clone calls for thread creation pass
CLONE_FILES, but fork(3) calls clone without CLONE_FILES" so that
folks who know how to use the C library but not how it's implemented
don't need to ask their friendly local C library implementer (me)
exactly how CLONE_FILES works :-)

  --elliott
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
