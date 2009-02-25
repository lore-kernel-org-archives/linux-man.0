From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: man-pages-3.19 released
Date: Wed, 25 Feb 2009 15:21:24 +1300
Message-ID: <cfd18e0f0902241821u3908dcedh43b4c7b955e3e04b@mail.gmail.com>
References: <cfd18e0f0902241819p3e2cc654s1152bc1713ad7659@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0902241819p3e2cc654s1152bc1713ad7659-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

 man-pages-3.19.tar.gz - man pages for Linux

This release is now available for download at:

 http://www.kernel.org/pub/linux/docs/man-pages
 or ftp://ftp.kernel.org/pub/linux/docs/man-pages

The online changelog is available at
http://www.kernel.org/doc/man-pages/changelog.html
(blogged at
http://linux-man-pages.blogspot.com/2009/02/man-pages-319-is-released.html)
and the current version of the pages is browsable at
http://www.kernel.org/doc/man-pages/

You are receiving this message either because:

a) You contributed to the content of this release.

b) You are subscribed to linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (*).

c) I have information (possibly inaccurate) that you are the maintainer of
a translation of the manual pages, or are the maintainer of the manual
pages set in a particular distribution, or have expressed interest in
helping with man-pages maintenance, or have otherwise expressed interest in
being notified about man-pages releases.  If you don't want to receive such
messages from me, or you know of some other translator or maintainer who
may want to receive such notifications, send me a message.

Cheers,

Michael

=================== Changes in man-pages-3.19 ===================

Released: 2009-02-20, Putaruru


Contributors
------------

The following people contributed notes, ideas, or patches that have
been incorporated in changes in this release:

Christian Siebert <christian.siebert-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Jan Engelhardt <jengelh-nopoi9nDyk+ELgA04lAiVw@public.gmane.org>
Jens Thoms Toerring <jt-ea6gLeB8pccb1SvskN2V4Q@public.gmane.org>
Kir Kolyshkin <kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Parag Warudkar <parag.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>
Sami Liedes <sliedes-kf+aQKke1yb1KXRcyAk9cg@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

timer_create.2
    Michael Kerrisk
        New page documenting timer_create(2)

timer_delete.2
    Michael Kerrisk
        New page documenting timer_delete(2)

timer_getoverrun.2
    Michael Kerrisk
        New page documenting timer_getoverrun(2)

timer_settime.2
    Michael Kerrisk
        New page documenting timer_settime(2) and timer_gettime(2)


New and changed links
---------------------

timer_gettime.2
    Michael Kerrisk
        New link to new timer_settime.2


Global changes
--------------

Various pages
    Kir Kolyshkin
        Trivial punctuation fixes in SEE ALSO
            In SEE ALSO, when a few man pages are referenced, those
            are divided by commas.  Every reference is on a separate
            line, and all lines but the last one should end with
            comma. I spotted one place where there is no comma in
            between references, and mocked up an awk script to find
            similar places:

            for f in man*/*; do
                awk '
                    /^.SH ["]SEE ALSO["]/ {
                        sa=1; print "== " FILENAME " =="; print; next
                    }
                    /^\.(PP|SH)/ {
                        sa=0; no=0; next
                    }
                    /^\.BR/ {
                        if (sa==1) {
                            print;
                            if (no == 1)
                                print "Missing comma in " FILENAME "
+" FNR-1; no=0
                        }
                    }
                    /^\.BR .*)$/ {
                        if (sa==1)
                            no=1;
                        next
                    }
                    /\.\\"/ {next}
                    /.*/ {
                        if (sa==1) {
                            print; next
                        }
                    }
                ' $f;
            done | fgrep 'Missing comma'

            This patch fixes all the places found by the above script.

            Also, there is an extra dot at the end of uri.7 "SEE ALSO"
            section.  Removed as per man-pages(7) recommendation.


Changes to individual pages
---------------------------

getitimer.2, clock_getcpuclockid.3, time.7
    Michael Kerrisk
        SEE ALSO: add timer_create(2)

getitimer.2
    Michael Kerrisk
        Rename arguments for consistency with other timer pages
            Also some other minor wording improvements

splice.2
    Mark Hills
        ERRORS: Add EINVAL case for file opened O_APPEND
            Target file cannot be opened in append (O_APPEND) mode

            In kernels prior to v2.6.27 splice() to a file in
            append mode is broken, and since that version it is
            disallowed. It is possible this behaviour may change
            in the future; see the kernel commit message
            (efc968d450e013049a662d22727cf132618dcb2f) for more
            information.

syscalls.2
    Michael Kerrisk
        Note that getpmsg(2) and putmsg(2) are unimplemented
            See See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=514771

timerfd_create.2
    Michael Kerrisk
        ERRORS: add EFAULT

timerfd_create.2
    Michael Kerrisk
        Rename timerfd_settime() 'curr_value' arg to 'old_value'
            For consistency with related pages.

vm86.2
    Parag Warudkar
        CONFORMING TO: Add 32-bit specific
            Note that this call is only on *32-bit* Intel

mq_open.3
    Michael Kerrisk
        ERRORS: add ENOENT error for name == "/"

mq_open.3
    Michael Kerrisk
        ERRORS: Add EACCES error for name containing > 1 slash

sem_open.3
    Michael Kerrisk
        ERRORS: add EINVAL error where name == "/"

sem_open.3
    Jens Thoms Toerring
        Add case of non-well-formed name to ENOENT

shm_open.3
    Michael Kerrisk
        Clarify rules for construction of shared memory object names

proc.5
    Michael Kerrisk
        Add description of /proc/sys/kernel/sysrq
            Reported by: Goerghe Cosorea <gheorghe.coserea-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

proc.5
    Michael Kerrisk
        Put /proc/modules entry in correct alphabetical order

ascii.7
    Kir Kolyshkin
        Fix formatting of tables on second page to use monospaced font

mq_overview.7
    Michael Kerrisk
        Clarify construction rules for message queue object names

sem_overview.7
    Michael Kerrisk
        Clarify construction rules for semaphore object names
            See also
http://groups.google.com/group/comp.os.linux.development.apps/browse_thread/thread/b4a67caa765cb65f
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
