From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: getopt(3) redundancy/confusion?
Date: Wed, 25 Jan 2017 10:30:17 +1300
Message-ID: <CAKgNAkjp0s+6WkDY+MjT3z6MWL_JePQSxS3UgsOS-aC2ev_5Fw@mail.gmail.com>
References: <979857989.4058982.1485234629697.ref@mail.yahoo.com>
 <979857989.4058982.1485234629697@mail.yahoo.com> <CAKgNAkieOmRVPt24mH8pOvPFr7s+dpfx3kHSPBVyfu4ronxv=Q@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkieOmRVPt24mH8pOvPFr7s+dpfx3kHSPBVyfu4ronxv=Q@mail.gmail.com>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Wiersba <jrw32982-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

> I'll give some thought to further clarifications.

Something like this:

       While processing the option list, getopt() can detect two kinds of
       errors: (1) an option character that was  not  specified  in  opt=E2=
=80=90
       string  and  (2) a missing option argument (i.e., an option at the
       end of the command  line  without  an  expected  argument).   Such
       errors are handled and reported as follows:

       *  By default, getopt() prints an error message on standard error,
          places the erroneous option character in  optopt,  and  returns
          '?' as the function result.

       *  If  the caller has set the global variable opterr to zero, then
          getopt() does not print  an  error  message.   The  caller  can
          determine  that there was an error by testing whether the func=E2=
=80=90
          tion return value is '?'.  (By default, opterr  has  a  nonzero
          value.)

       *  If  the  first  character  (following  any  optional '+' or '-'
          described above) of optstring is a colon (':'),  then  getopt()
          likewise  does  not  print  an  error message.  In addition, it
          returns ':' instead of '?' to indicate a missing  option  argu=E2=
=80=90
          ment.   This allows the caller to distinguish the two different
          types of errors.

Easier to parse, I hope(?).

Cheers,

Michael
--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
