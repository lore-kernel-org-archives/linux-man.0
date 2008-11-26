From: Sukadev Bhattiprolu <sukadev-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [RFC] devpts man page update
Date: Wed, 26 Nov 2008 10:17:32 -0800
Message-ID: <20081126181732.GA1509@us.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, Alan Cox <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>, hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: serue-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org, sukadev-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Michael,

Following is some text that would need to be added to devpts section of
mount(8) man page (its not a formal patch, just the text to be added).
I am looking for logistics and a general review of the text to be added.

The relevant kernel patches are currently in ttydev/linux-next trees.
I can send the formal man page patch after those patches go into mainline.

Also, is it ok to refer to 'Documentation' directory in the man page  -
there are several semantics outlined in Documentation/filesystem/devpts.txt
(http://www.linux.org.uk/~alan/ttydev/pty-multiple-doc), that may be of
use only to users of containers.

Thanks,

Suka

---
--- devpts.manpage.orig	2008-11-26 10:04:11.000000000 -0800
+++ devpts.manpage	2008-11-26 10:02:15.000000000 -0800
@@ -1,3 +1,4 @@
+
 Mount options for devpts
 	The  devpts  file system is a pseudo file system, traditionally mounted
 	on /dev/pts.  In order to acquire a pseudo terminal,  a  process  opens
@@ -17,3 +18,48 @@
 		default is 0600.  A value of mode=620 and gid=5 makes  "mesg  y"
 		the default on newly created PTYs.
 
+	newinstance
+
+		Create a private instance of devpts filesystem, such that
+		indices of ptys allocated in this new instance of the
+		filesystem are independent of indices created in other
+		instances of devpts.
+
+		If this option is not specified for a mount of devpts, 
+		("legacy mode"), that instance of devpts shares the pty
+		indices with the initial/default mount of devpts. i.e.
+		all mounts of devpts without this 'newinstance' option
+		share the same set of pty indices. Each mount of devpts
+		with newinstance option has a private set of pty indices.
+
+		This option is mainly used to support containers in the
+		linux kernel. It is implemented in linux kernel versions
+		starting with 2.6.XX.  Further, this mount option is valid
+		only if CONFIG_DEVPTS_MULTIPLE_INSTANCES is enabled in the
+		kernel configuration.
+
+		To use this option effectively, '/dev/ptmx' must be a
+		symlink to 'pts/ptmx'. See Documentation/filesystems/
+		devpts.txt for details.
+
+	ptmxmode=value
+ 
+		Set the mode for the new 'ptmx' device node in the devpts
+		filesystem. Default mode is 0000 for compatibility with
+		legacy mode of devpts.
+
+		This option is only implemented in linux kernel versions
+		starting with 2.6.XX. Further this option is valid only if 
+		CONFIG_DEVPTS_MULTIPLE_INSTANCES is enabled in the kernel
+		configuration.
+
+		With support for multiple instances of devpts (see
+		'newinstance' option above), each instance has a private
+		'ptmx' node in the root of the devpts filesystem (typically
+		'/dev/pts/ptmx').
+
+		For compatibility with older versions of the kernel, the
+		default mode ot the new 'ptmx' node is 0000. 'ptmxmode'
+		option specifies a more useful mode for the 'ptmx' node
+		and is highly recommended when the 'newinstance' option
+		is specified.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
