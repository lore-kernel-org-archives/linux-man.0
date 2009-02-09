From: =?iso-8859-1?b?RnLpZOlyaWM=?= Maria <frederic.maria-GANU6spQydw@public.gmane.org>
Subject: Patch on man4/tty_ioctl.4 regarding TIOCMIWAIT & TIOCGICOUNT
Date: Mon, 09 Feb 2009 11:48:00 +0100
Message-ID: <1234176480.499009e0c8303@imp.free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="-MOQ123417648073f9ebdba6b6458217ecf6c980959b0f"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This message is in MIME format.

---MOQ123417648073f9ebdba6b6458217ecf6c980959b0f
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Hello,

for a personal project I was interrested in using the wait for interrupt
capability of serial ports.

After searching for documentation I found very few data about the tty ioctl
commands: TIOCMIWAIT and TIOCGICOUNT.
Moreover this was not documented in man4/tty_ioctl.4 file.

So here is a possible patch to add quick information on TIOCMIWAIT and
TIOCGICOUNT commands.

This patch is against version 3.17 of the man pages.

Please do not hesitate to correct english terms as this is not my birth tongue.


Best regards
Fred



--- /home/fred/man-pages-3.17/man4/tty_ioctl.4	2009-01-19 05:14:02.000000000
+0100
+++ /home/fred/man-pages-3.17-new/man4/tty_ioctl.4	2009-02-09 10:20:43.363377700
+0100
@@ -349,18 +349,26 @@
 .SS "Modem control"
 .TP
 .BI "TIOCMGET	int *" argp
-get the status of modem bits.
+Get the status of modem bits.
 .TP
 .BI "TIOCMSET	const int *" argp
-set the status of modem bits.
+Set the status of modem bits.
 .TP
 .BI "TIOCMBIC	const int *" argp
-clear the indicated modem bits.
+Clear the indicated modem bits.
 .TP
 .BI "TIOCMBIS	const int *" argp
-set the indicated modem bits.
+Set the indicated modem bits.
+.TP
+.BI "TIOCMIWAIT	int " arg
+Wait for any of the 4 modem bits (DCD, RI, DSR, CTS) to change.
+The mask is passed in arg for bits of interest (use |'ed
+TIOCM_RNG/DSR/CD/CTS for masking).
+Caller should use
+.B TIOCGICOUNT
+to see which one it was.
 .LP
-Bits used by these four ioctls:
+Bits used by these five ioctls:

 .nf
 TIOCM_LE        DSR (data set ready/line enable)
@@ -375,6 +383,15 @@
 TIOCM_RI         see TIOCM_RNG
 TIOCM_DSR       DSR (data set ready)
 .fi
+.TP
+.BI "TIOCGICOUNT	struct serial_icounter_struct *" argp
+Get counter of input serial line interrupts (DCD, RI, DSR, CTS).
+Write counters to the user passed
+.I argp
+serial_icounter_struct structure.
+.br
+NB: both 1->0 and 0->1 transitions are counted except for
+RI where only 0->1 is counted.
 .SS "Marking a line as local"
 .TP
 .BI "TIOCGSOFTCAR	int *" argp





---MOQ123417648073f9ebdba6b6458217ecf6c980959b0f
Content-Type: application/octet-stream; name="tty_ioctl.4.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="tty_ioctl.4.patch"

LS0tIC9ob21lL2ZyZWQvbWFuLXBhZ2VzLTMuMTcvbWFuNC90dHlfaW9jdGwuNAkyMDA5LTAxLTE5
IDA1OjE0OjAyLjAwMDAwMDAwMCArMDEwMAorKysgL2hvbWUvZnJlZC9tYW4tcGFnZXMtMy4xNy1u
ZXcvbWFuNC90dHlfaW9jdGwuNAkyMDA5LTAyLTA5IDEwOjIwOjQzLjM2MzM3NzcwMCArMDEwMApA
QCAtMzQ5LDE4ICszNDksMjYgQEAKIC5TUyAiTW9kZW0gY29udHJvbCIKIC5UUAogLkJJICJUSU9D
TUdFVAlpbnQgKiIgYXJncAotZ2V0IHRoZSBzdGF0dXMgb2YgbW9kZW0gYml0cy4KK0dldCB0aGUg
c3RhdHVzIG9mIG1vZGVtIGJpdHMuCiAuVFAKIC5CSSAiVElPQ01TRVQJY29uc3QgaW50ICoiIGFy
Z3AKLXNldCB0aGUgc3RhdHVzIG9mIG1vZGVtIGJpdHMuCitTZXQgdGhlIHN0YXR1cyBvZiBtb2Rl
bSBiaXRzLgogLlRQCiAuQkkgIlRJT0NNQklDCWNvbnN0IGludCAqIiBhcmdwCi1jbGVhciB0aGUg
aW5kaWNhdGVkIG1vZGVtIGJpdHMuCitDbGVhciB0aGUgaW5kaWNhdGVkIG1vZGVtIGJpdHMuCiAu
VFAKIC5CSSAiVElPQ01CSVMJY29uc3QgaW50ICoiIGFyZ3AKLXNldCB0aGUgaW5kaWNhdGVkIG1v
ZGVtIGJpdHMuCitTZXQgdGhlIGluZGljYXRlZCBtb2RlbSBiaXRzLgorLlRQCisuQkkgIlRJT0NN
SVdBSVQJaW50ICIgYXJnCitXYWl0IGZvciBhbnkgb2YgdGhlIDQgbW9kZW0gYml0cyAoRENELCBS
SSwgRFNSLCBDVFMpIHRvIGNoYW5nZS4KK1RoZSBtYXNrIGlzIHBhc3NlZCBpbiBhcmcgZm9yIGJp
dHMgb2YgaW50ZXJlc3QgKHVzZSB8J2VkCitUSU9DTV9STkcvRFNSL0NEL0NUUyBmb3IgbWFza2lu
ZykuCitDYWxsZXIgc2hvdWxkIHVzZQorLkIgVElPQ0dJQ09VTlQKK3RvIHNlZSB3aGljaCBvbmUg
aXQgd2FzLgogLkxQCi1CaXRzIHVzZWQgYnkgdGhlc2UgZm91ciBpb2N0bHM6CitCaXRzIHVzZWQg
YnkgdGhlc2UgZml2ZSBpb2N0bHM6CiAKIC5uZgogVElPQ01fTEUgICAgICAgIERTUiAoZGF0YSBz
ZXQgcmVhZHkvbGluZSBlbmFibGUpCkBAIC0zNzUsNiArMzgzLDE1IEBACiBUSU9DTV9SSSAgICAg
ICAgIHNlZSBUSU9DTV9STkcKIFRJT0NNX0RTUiAgICAgICBEU1IgKGRhdGEgc2V0IHJlYWR5KQog
LmZpCisuVFAKKy5CSSAiVElPQ0dJQ09VTlQJc3RydWN0IHNlcmlhbF9pY291bnRlcl9zdHJ1Y3Qg
KiIgYXJncAorR2V0IGNvdW50ZXIgb2YgaW5wdXQgc2VyaWFsIGxpbmUgaW50ZXJydXB0cyAoRENE
LCBSSSwgRFNSLCBDVFMpLgorV3JpdGUgY291bnRlcnMgdG8gdGhlIHVzZXIgcGFzc2VkCisuSSBh
cmdwCitzZXJpYWxfaWNvdW50ZXJfc3RydWN0IHN0cnVjdHVyZS4KKy5icgorTkI6IGJvdGggMS0+
MCBhbmQgMC0+MSB0cmFuc2l0aW9ucyBhcmUgY291bnRlZCBleGNlcHQgZm9yCitSSSB3aGVyZSBv
bmx5IDAtPjEgaXMgY291bnRlZC4KIC5TUyAiTWFya2luZyBhIGxpbmUgYXMgbG9jYWwiCiAuVFAK
IC5CSSAiVElPQ0dTT0ZUQ0FSCWludCAqIiBhcmdwCg==

---MOQ123417648073f9ebdba6b6458217ecf6c980959b0f--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
