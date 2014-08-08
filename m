From: Nicolas Hillegeer <nicolashillegeer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages: splice() system call max length?
Date: Fri, 8 Aug 2014 10:26:33 +0200
Message-ID: <CACqJ-1eZ_zfg7H2ELQpiz40vdLazTkmhchq0RgrPW6W0FougDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

(this is yet another retry, the mail server keeps bouncing it back,
trying plain text mode now)

Dear Michael,

I was experimenting with tee() and splice() to recreate my own toy tee
program and noticed that there's something "strange" going with the
size of the passed in "len" to the splice() system call.

My fixed program: https://gist.github.com/aktau/b2f758962a6e96afc178

Sorry for the debugging code littered around the code. But to make a
long story short:

For different types of input file descriptor, the call to splice
reacts differently (let's only take the ctee() code path now):

(by the way, I'm on linux kernel 3.15.8 and eglibc 2.17-96)

input   |   output |  example
-----------------------------------------
file      |       *     |  ./tee2 <<< "some text" OR ./tee2 < input.txt

Here, passing SSIZE_MAX or SIZE_MAX to len provokes an error: Invalid
argument. This is what I had initially. Looking at the man page for
splice() I find:

Target filesystem doesn't support splicing; target file is
              opened in append mode; neither of the descriptors refers to a
              pipe; or offset given for nonseekable device.

So I plain thought that it wasn't possible to splice() from a file, or
that the file wasn't opened correctly. It seemed like "Invalid
argument" could only be provoked by in_fd or out_fd being faulty. So
in the beginning I didn't suspect the "len" argument.

Yet, for some reason I couldn't believe I was unable to splice from
files, and when fiddling around with it I noticed that copying fewer
bytes did work. Working up I found that I could safely pass INT_MAX
and everything would be fine.

So I'd like to ask, who's fault is it, the kernel or libc? Or is the
manual omitting something, because it does list "len" as taking
size_t.

Even stranger, when triggering the ctee codepath with a pipe as input:

input   |   output |  example
-----------------------------------------
pipe    |       tty     echo "some text" | ./tee2

Everything works, even when passing SIZE_MAX. This is the thing that
caused me to take so long to find the root of the issue.




Anyway, if I'm just doing everything wrong and wasting your time, I'm
sorry. Thanks for the fantastic manpages!

Kind regards,
Nicolas
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
