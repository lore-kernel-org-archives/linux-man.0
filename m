From: Andres Freund <andres@anarazel.de>
Subject: SCM_RIGHTS and file descriptor limits
Date: Tue, 15 May 2018 10:52:02 -0700
Message-ID: <20180515175202.glz4e4gxtarefna5@alap3.anarazel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>, mtk.manpages@gmail.com, Kees Cook <keescook@chromium.org>, David Windsor <dwindsor@gmail.com>, Hans Liljestrand <ishkamiel@gmail.com>, "Reshetova, Elena" <elena.reshetova@intel.com>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-man@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

Hi,

I'm not sure if this is a documentation omission, kernel code bug,
missing understanding on my part, or all of the above.

I'm looking at recvmsg()'s behaviour for AF_UNIX, where the sender has
sent an fd using SCM_RIGHTS, and the receiving process has already
exceeded RLIMIT_NOFILE.

By my reading of scm_detach_fds() (called from
unix_stream_read_generic() / unix_dgram_recvmsg(), via scm_recv()), the
error appears to just be thrown away, with no notification given to
userland at all:

void scm_detach_fds(struct msghdr *msg, struct scm_cookie *scm)
{
...
	for (i=0, cmfptr=(__force int __user *)CMSG_DATA(cm); i<fdmax;
	     i++, cmfptr++)
	{
		struct socket *sock;
		int new_fd;
		err = security_file_receive(fp[i]);
		if (err)
			break;
		err = get_unused_fd_flags(MSG_CMSG_CLOEXEC & msg->msg_flags
					  ? O_CLOEXEC : 0);
		if (err < 0)
			break;

If I understand correctly no error is reported to the user (function
returns void, no put_user() calls for the unsuccessful fds/i), but all
the scm data is "consumed" via scm_destroy().

Silently consuming data without reporting an error doesn't strike me as
nice. Now admittedly scm is one of the more kludgey interfaces, and it's
not entirely obvious how one would do much better without significant
added complication - the correct behaviour seems to be to return EMFILE,
but that'd need to somehow rewind the received data, which seems
complicated...  On the other hand it's not generally knowable how many
file descriptors the other side sent, so one really needs to duplicate
all scm information on the data level to make sure nothing gets lost.

In case this is something that won't be fixed, it seems appropriate to
add a section to the man pages (hence CCing linux man-pages list)

Greetings,

Andres Freund
