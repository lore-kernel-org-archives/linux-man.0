From: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Subject: Re: inotifywait man page--possible error
Date: Thu, 12 Feb 2015 09:10:48 +0100
Message-ID: <54DC6008.2030501@supelec.fr>
References: <5820328.QymD6BquXU@midnight>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5820328.QymD6BquXU@midnight>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tom Canavan <tmscanavan-Lh2ygAtTN0NSV923RJcDwA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Tom,

thank you for your report. Actually, this example is correct as it is. =
Did you copy it verbatim?
If you replace "while" by "until", the script will stop after inotifywa=
it returns without entering the
body loop. With "while", it will enter the body loop and then, restart =
from inotifywait until
another modification occurs.

Of course, the script does have problems for practical use such as the =
fact that while
you are in the body loop, you're not watching the file anymore, and the=
re is a race condition
which could make you miss apache events but that's because it's just a =
toy example.

Laurent


Le 12/02/2015 02:54, Tom Canavan a =E9crit :
> I noticed a problem with example no. 2 at toward the bottom of the pa=
ge.  I=20
> tried and tried to get this to work.  It would not.  Then I replaced =
the word=20
> "while" with the word "until".  Then it works.  Sorry to trouble you.=
  I'm=20
> just a beginner at scripting, and this may not be an error at all, an=
d might=20
> somehow be my fault.    Forgive me if I am wrong.  I am only relating=
 what=20
> happened on *my* system I'm using Fedora 18.  My only goal in writing=
 you to=20
> possibly save some other beginner a headache if it *is* a mistake.
>
> Tom
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
