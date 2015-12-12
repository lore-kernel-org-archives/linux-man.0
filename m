From: Alec Leamas <leamas.alec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: New manpage lirc.4 (Was: Possibly new manpages: lirc and
 lirc_ioctl)
Date: Sat, 12 Dec 2015 07:34:18 +0100
Message-ID: <20151212073418.088593cb@snorken.kolmodin.net>
References: <548EE482.4020700@gmail.com>
	<54998ACB.2070500@gmail.com>
	<554789CA.2070302@gmail.com>
	<5547A19B.9080503@gmail.com>
	<5547B8F1.2000305@gmail.com>
	<5547CD95.2070208@gmail.com>
	<5663FD8C.9030204@gmail.com>
	<CAKgNAkj3C2ApPhBfUiQVtptquS5b5Cfti+gdpqbXbOR2tCWBFg@mail.gmail.com>
	<5664AAA5.6040203@gmail.com>
	<566B20F0.1020808@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <566B20F0.1020808-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, 11 Dec 2015 20:16:00 +0100
"Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> > +.TH LIRC 4 "Aug 2015" "Linux" "Linux Programmer's Manual"
> > +.\" Copyright (c) <year>, <copyright holder>
> 
> As you noted, this needs fixing.

Done
 
> Your mailer is wrapping text in your patches, Please fix.

Hm... claws-mail did the trick for the kernel patch, using that also 
for this which hopefully should fix it.

> > +.B LIRC_MODE_LIRCCODE.
> 
> .BR LIRC_MODE_LIRCCODE .

> Similarly, other cases below need fixing. 

Done (unless i missed something...)

> > +In the \fBLIRC_MODE_MODE2 mode\fR, the driver read() provides 32-bit values
> > +representing a space or a pulse duration, by convention typed as lirc_t.
> 
> .IR lirc_t .

Done

> > +Value reflects a pulse duration (us).
> 
> s/us/microseconds/
> (Many other instances in the page need fixing also)

Done.

> > +button presses. The length of each packet can be retrieved using
> 
> Please start new sentences on new source lines. (See man-pages(7).)

Done (again, unless I missed something).

> In all cases where you talk about a negative error code, change this
> to "returns an error". (By the time error numbers reach user space they
> are positive values in 'errno'.)

Oops... done.

> 
> > +.B LIRC_GET_REC_MODE
> 
> .BR LIRC_GET_REC_MODE ,

Done

> > +these  returns \fI-ENOIOCTLCMD\fR or \fI-ENOSYS\fR if the operation
> 
> fail with the error \fIENOIOCTLCMD\fR or \fIENOSYS\fR
> 
> > +isn't supported and \fI-EINVAL\fR if operation failed.
> 
> s/-EINVAL/EINQAL/
> 
> Likewise for various cases below.

Done

> reserved for future use == it is an error to specify 0 or 100?
> 
> If so, make that explicit. If it isn't an error, why not? If you
> want to reserve these value for future use, then the driver should
> error on them now.

Agreed, but I'm not the upstream for the driver. For now, specifying
that 0 < value < 100.

> > +Some devices have a fixed timeout, in that case both ioctls will
> 
> "both ioctls"? It's not clear which ioctls are being referred 
> to. List them explicitly.

Done

> > +Returns the driver resolution (us).
> 
> s/us/microseconds/

Done

> > +Note: wide band receiver might be implictly enabled if you enable
> 
> implicitly

Done


> > +is a bitmask combining the following bits.
> 
> s/\./:/

Done


> > +device does not have so many transmitters, returns the number of available
> > +transitters and does nothing otherwise.
> 
> transmitters

Done

Cheers!

--alec

Revised patch:

>From 68455824f90bc414f5091d9f8b1904e507ff036d Mon Sep 17 00:00:00 2001
From: Alec Leamas <leamas.alec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Sun, 6 Dec 2015 22:20:07 +0100
Subject: [PATCH] doc: lirc.4 upstream review remarks fixes.

---
 doc/man-source/lirc.4 | 319 ++++++++++++++++++++++++++++----------------------
 1 file changed, 182 insertions(+), 137 deletions(-)

diff --git a/doc/man-source/lirc.4 b/doc/man-source/lirc.4
index 56d7f08..68685df 100644
--- a/doc/man-source/lirc.4
+++ b/doc/man-source/lirc.4
@@ -1,54 +1,80 @@
 .TH LIRC 4 "Aug 2015" "Linux" "Linux Programmer's Manual"
+
+
+.\" Copyright (c) 2015, Alec Leamas
+.\"
+.\" %%%LICENSE_START(GPLv2+_DOC_FULL)
+.\" This is free documentation; you can redistribute it and/or
+.\" modify it under the terms of the GNU General Public License as
+.\" published by the Free Software Foundation; either version 2 of
+.\" the License, or (at your option) any later version.
+.\"
+.\" The GNU General Public License's references to "object code"
+.\" and "executables" are to be interpreted as the output of any
+.\" document formatting or typesetting system, including
+.\" intermediate and printed output.
+.\"
+.\" This manual is distributed in the hope that it will be useful,
+.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
+.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+.\" GNU General Public License for more details.
+.\"
+.\" You should have received a copy of the GNU General Public
+.\" License along with this manual; if not, see
+.\" <http://www.gnu.org/licenses/>.
+.\" %%%LICENSE_END
 .SH NAME
 lirc \- lirc devices
 .SH DESCRIPTION
 .P
 \fB/dev/lirc*\fR are character devices providing a low-level
-bi-directional interface to IR remotes.
-When receiving data the driver works in two different modes depending on the
-underlying hardware.
+bi-directional interface to infra-red (IR) remotes.
+When receiving data, the driver works in two different modes depending
+on the underlying hardware.
 .P
-Some hardware (typically TV-cards) decodes the IR signal internally and just
-provides decoded button presses as integer values.
-Drivers for this kind of hardware works in
+Some hardware (typically TV-cards) decodes the IR signal internally
+and just provides decoded button presses as integer values.
+Drivers for this kind of hardware work in
 .B LIRC_MODE_LIRCCODE.
 Such hardware usually does not support sending IR signals.
-Furthermore, it usually only works with a specific remote which is bundled
-with e. g., a TV-card.
+Furthermore, it usually only works with a specific remote which is
+bundled with, for example, a TV-card.
 .P
 Other hardware provides a stream of pulse/space durations.
-Such drivers works in
-.B LIRC_MODE_MODE2.
+Such drivers work in
+.BR LIRC_MODE_MODE2.
 Sometimes, this kind of hardware also supports
 sending IR data.
-It can be used with (almost) any kind of remote.
+Such hardware can be used with (almost) any kind of remote.
 .P
 The \fBLIRC_GET_REC_MODE\fR ioctl allows probing for the mode.
 
 .SH Reading using LIRC_MODE_MODE2 drivers
 .P
 In the \fBLIRC_MODE_MODE2 mode\fR, the driver read() provides 32-bit values
-representing a space or a pulse duration, by convention typed as lirc_t.
-The time of the duration (us) is encoded in the lower 24 bits.
+representing a space or a pulse duration, by convention typed as
+.IR lirc_t.
+The time of the duration (microseonds) is encoded in the lower 24 bits.
 The upper 8 bit reflects the type of package:
 .TP 4
-.B LIRC_MODE2_SPACE
-Value reflects a space duration (us).
+.BR LIRC_MODE2_SPACE
+Value reflects a space duration (microseconds).
 .TP 4
-.B LIRC_MODE2_PULSE
-Value reflects a pulse duration (us).
+.BR LIRC_MODE2_PULSE
+Value reflects a pulse duration (microseconds).
 .TP 4
-.B LIRC_MODE2_FREQUENCY
+.BR LIRC_MODE2_FREQUENCY
 Value reflects a frequency (hz), see the LIRC_SET_MEASURE_CARRIER ioctl.
 .TP 4
-.B LIRC_MODE2_TIMEOUT
+.BR LIRC_MODE2_TIMEOUT
 The package reflects a timeout, see the LIRC_SET_REC_TIMEOUT_REPORTS ioctl.
 
 .SH Reading using LIRC_MODE_LIRCCODE drivers.
 .P
 In the \fBLIRC_MODE_LIRCCODE\fR
 mode, the data returned by read() reflects decoded
-button presses. The length of each packet could be retrieved using
+button presses.
+The length of each packet can be retrieved using
 the  \fBLIRC_GET_LENGTH\fR ioctl.
 read() on the device must be done in blocks matching
 the bit count, rounded up so it matches full bytes.
@@ -57,15 +83,15 @@ the bit count, rounded up so it matches full bytes.
 .P
 When sending data, only the \fBLIRC_MODE_PULSE\fR
 mode is supported.
-The data written to the chardev using write() is a pulse/space sequence
-of integer values.
+The data written to the character device using write() is a pulse/space
+sequence of integer values.
 Pulses and spaces are only marked implicitly by their position.
 The data must start and end with a pulse, thus it must always include an odd
 number of samples.
 The write() function  blocks until the data has been transmitted by the
 hardware. If more data is provided than the hardware can send, the driver
 returns
-.B EINVAL
+.BR EINVAL
 
 .SH SUPPORTED IOCTL COMMANDS
 .P
@@ -74,11 +100,11 @@ returns
 int ioctl(int fd, int cmd, ...);
 .fi
 .P
-The following ioctls can be used to to probe or change specific lirc
+The following ioctls can be used to probe or change specific lirc
 hardware settings.
 Many require a third argument, usually an int.
 .P
-In general each driver should have a default set of settings.
+In general, each driver should have a default set of settings.
 The driver implementation is expected to re-apply the default settings
 when the device is closed by userspace, so that every application opening
 the device can rely on working with the default settings initially.
@@ -88,111 +114,117 @@ the device can rely on working with the default settings initially.
 .P
 \fI/dev/lirc*\fR devices always supports the following commands:
 .TP 4
-.B LIRC_GET_FEATURES void
+.BR LIRC_GET_FEATURES void
 Returns a bitmask of combined features bits, see FEATURES.
 Some drivers have dynamic features which are not updated until after
 an init() command.
 .TP 4
-.B LIRC_GET_REC_MODE void
+.BR LIRC_GET_REC_MODE void
 Returns the receive mode, one of
 .RS 4
 .TP
-.B LIRC_MODE_MODE2
+.BR LIRC_MODE_MODE2
 Driver return a sequence of pulse/space durations.
 .TP
-.B LIRC_MODE_LIRCCODE
+.BR LIRC_MODE_LIRCCODE
 Driver returns integer values, each of which representing a decoded button
 press.
 .RE
 .P
-If a device returns a negative error code  for
-.B LIRC_GET_REC_MODE
+If a device returns an error code  for
+.BR LIRC_GET_REC_MODE
 it is safe to assume it is not a lirc device.
 
 .BR
 .SH Optional Commands
 .P
-Some lirc devices supports the following commands. Unless otherwise stated
-these  returns \fI-ENOIOCTLCMD\fR or \fI-ENOSYS\fR if the operation
-isn't supported and \fI-EINVAL\fR if operation failed.
+Some lirc devices supports the following commands.
+Unless otherwise stated these returns \fIENOIOCTLCMD\fR
+or \fIENOSYS\fR if the operation
+isn't supported and \fIEINVAL\fR if operation failed.
 .TP
-.B LIRC_SET_REC_MODE  " (\fIint\fP)"
+.BR LIRC_SET_REC_MODE  " (\fIint\fP)"
 Set the receive mode, either
-.B LIRC_MODE_LIRCCODE
+.BR LIRC_MODE_LIRCCODE
 or
-.B LIRC_MODE_MODE2.
+.BR LIRC_MODE_MODE2.
 
 .TP
-.B LIRC_GET_LENGTH " (\fIvoid\fP)"
+.BR LIRC_GET_LENGTH " (\fIvoid\fP)"
 Return the positive  length of the returned codes for
-.B LIRC_LIRCCODE
+.BR LIRC_LIRCCODE
 type
 drivers, otherwise
-.B -ENOIOCTLCMD.
+.BR ENOIOCTLCMD.
 .TP
-.B  LIRC_GET_SEND_MODE " (\fIvoid\fP)"
+.BR  LIRC_GET_SEND_MODE " (\fIvoid\fP)"
 Returns the send mode; currently only
-.B LIRC_MODE_PULSE
+.BR LIRC_MODE_PULSE
 is supported.
 .TP
-.B LIRC_SET_SEND_MODE " (\fIint\fP)"
-Set the send mode.  Obsolete since only
-.B LIRC_MODE_PULSE
+.BR LIRC_SET_SEND_MODE " (\fIint\fP)"
+Set the send mode.
+Obsolete since only
+.BR LIRC_MODE_PULSE
 is supported.
 .TP
-.B LIRC_SET_SEND_CARRIER " (\fIint\fP)"
+.BR LIRC_SET_SEND_CARRIER " (\fIint\fP)"
 Set the modulation frequency. The argument is the frequency (Hz).
 .TP
-.B SET_SEND_DUTY_CYCLE " (\fIint\fP)"
-Set the carrier duty cycle. The argument is an int (0 <= value <= 100) which
-describes the pulse width in percent of the total cycle.  Currently, no
-special meaning is defined for 0 or 100, but the values are reserved for
-future use.
+.BR SET_SEND_DUTY_CYCLE " (\fIint\fP)"
+Set the carrier duty cycle.
+The argument is an int (0 < value < 100) which
+describes the pulse width in percent of the total cycle.
+Currently, no special meaning is defined for 0 or 100, but the values
+are reserved for future use.
 .TP
-.B LIRC_GET_MIN_TIMEOUT " (\fIvoid\fP)",  LIRC_GET_MAX_TIMEOUT " (\fIvoid\fP)"
+.BR LIRC_GET_MIN_TIMEOUT " (\fIvoid\fP)",  LIRC_GET_MAX_TIMEOUT " (\fIvoid\fP)"
 Some devices have internal timers that can be used to detect when
 there's no IR activity for a long time.
 This can help lircd in detecting that a IR signal is finished and
 can speed up the decoding process.
 Returns an integer value with the minimum/maximum timeout that can be
 set.
-Some devices have a fixed timeout, in that case both ioctls will
-return the same value even though the timeout cannot be changed.
+Some devices have a fixed timeout, in that case
+.BR LIRC_GET_MIN_TIMEOUT
+and
+.BR LIRC_GET_MAX_TIMEOUT
+will return the same value even though the timeout cannot be changed.
 .TP
-.B LIRC_SET_REC_TIMEOUT " (\fIint\fP)"
-Sets the integer value for IR inactivity timeout. To be accepted, the
-value must be within the limits defined by
-.B LIRC_GET_MIN_TIMEOUT
+.BR LIRC_SET_REC_TIMEOUT " (\fIint\fP)"
+Sets the integer value for IR inactivity timeout.
+To be accepted, the value must be within the limits defined by
+.BR LIRC_GET_MIN_TIMEOUT
 and
-.B LIRC_GET_MAX_TIMEOUT.
+.BR LIRC_GET_MAX_TIMEOUT.
 A value of 0 (if supported by the hardware) disables all hardware timeouts
 and data should be reported as soon as possible.
 If the exact value cannot be set, then the next possible value
 .I greater
 than the given value should be set.
 .TP
-.B LIRC_SET_REC_TIMEOUT_REPORTS " (\fIint\fP)"
+.BR LIRC_SET_REC_TIMEOUT_REPORTS " (\fIint\fP)"
 Enables/disables (1/0) timeout packages in
-.B LIRC_MODE_MODE2.
+.BR LIRC_MODE_MODE2.
 By default, timeout reports should be turned off.
 .TP
-.B LIRC_SET_REC_CARRIER " (\fIint\fP)"
+.BR LIRC_SET_REC_CARRIER " (\fIint\fP)"
 Set the receive carrier frequency (Hz).
 .TP
-.B LIRC_SET_REC_CARRIER_RANGE " (\fIint\fP)"
+.BR LIRC_SET_REC_CARRIER_RANGE " (\fIint\fP)"
 First time called sets the lower bound of the carrier range, second time
 the upper bound (Hz).
 .TP
-.B LIRC_SET_MEASURE_CARRIER " (\fIint\fP)"
-Enable/disable (1/0) the measure mode. If enabled, from the next key
-press on, the driver will send
-.B LIRC_MODE2_FREQUENCY
+.BR LIRC_SET_MEASURE_CARRIER " (\fIint\fP)"
+Enable/disable (1/0) the measure mode.
+If enabled, from the next key press on, the driver will send
+.BR LIRC_MODE2_FREQUENCY
 packets. By default this should be turned off.
 .TP
-.B LIRC_GET_REC_RESOLUTION " (\fIvoid\fP)"
-Returns the driver resolution (us).
+.BR LIRC_GET_REC_RESOLUTION " (\fIvoid\fP)"
+Returns the driver resolution (microseconds).
 .TP
-.B LIRC_GET_MIN_FILTER_PULSE void, LIRC_GET_MAX_FILTER_PULSE void
+.BR LIRC_GET_MIN_FILTER_PULSE void, LIRC_GET_MAX_FILTER_PULSE void
 Some devices are able to filter out spikes in the incoming signal
 using given filter rules.
 These ioctls return the hardware capabilities that describe the bounds
@@ -201,21 +233,21 @@ Filter settings depend on the IR protocols that are expected.
 lircd derives the settings from all protocols definitions found in its
 config file.
 .TP
-.B LIRC_GET_MIN_FILTER_SPACE " (\fIvoid\fP)", LIRC_GET_MAX_FILTER_SPACE " (\fIvoid\fP)"
+.BR LIRC_GET_MIN_FILTER_SPACE " (\fIvoid\fP)", LIRC_GET_MAX_FILTER_SPACE " (\fIvoid\fP)"
 See
-.B LIRC_GET_MIN_FILTER_PULSE
+.BR LIRC_GET_MIN_FILTER_PULSE
 .TP
-.B LIRC_SET_REC_FILTER " (\fIint\fP)"
-Pulses/spaces shorter than this (us) are filtered out by hardware.
+.BR LIRC_SET_REC_FILTER " (\fIint\fP)"
+Pulses/spaces shorter than this (microseconds) are filtered out by hardware.
 .TP
-.B LIRC_SET_REC_FILTER_PULSE " (\fIint\fP)", LIRC_SET_REC_FILTER_SPACE " (\fIint\fP)"
-Pulses/spaces shorter than this (us) are filtered out by hardware. If
-filters cannot be set independently for pulse/space, the corresponding
+.BR LIRC_SET_REC_FILTER_PULSE " (\fIint\fP)", LIRC_SET_REC_FILTER_SPACE " (\fIint\fP)"
+Pulses/spaces shorter than this (microseconds) are filtered out by hardware.
+If filters cannot be set independently for pulse/space, the corresponding
 ioctls must return an error and
-.B LIRC_SET_REC_FILTER
+.BR LIRC_SET_REC_FILTER
 shall be used instead.
 .TP
-.B LIRC_SET_WIDEBAND_RECEIVER " (\fIint\fP)"
+.BR LIRC_SET_WIDEBAND_RECEIVER " (\fIint\fP)"
 Some receivers are equipped with special wide band receiver which is
 intended to be used to learn output of existing remote.
 Calling that ioctl with (1) will enable it, and with (0) disable it.
@@ -223,123 +255,136 @@ This might be useful of receivers that have otherwise narrow band receiver
 that prevents them to be used with some remotes.
 Wide band receiver might also be more precise.
 On the other hand its disadvantage usually is reduced range of reception.
-Note: wide band receiver might be implictly enabled if you enable
+Note: wide band receiver might be implicitly enabled if you enable
 carrier reports.
 In that case it will be disabled as soon as you disable carrier reports.
 Trying to disable wide band receiver while carrier reports are active will
 do nothing
 
 .TP
-.B LIRC_SETUP_START " (\fIvoid\fP)", LIRC_SETUP_END " (\fIvoid\fP)"
+.BR LIRC_SETUP_START " (\fIvoid\fP)", LIRC_SETUP_END " (\fIvoid\fP)"
 Setting of several driver parameters can be optimized by encapsulating
 the according ioctl calls with
-.B LIRC_SETUP_START/LIRC_SETUP_END.
+.BR LIRC_SETUP_START/LIRC_SETUP_END.
 When a driver receives a
-.B LIRC_SETUP_START
+.BR LIRC_SETUP_START
 ioctl it can choose to not commit further setting changes to the hardware
 until a
-.B LIRC_SETUP_END
+.BR LIRC_SETUP_END
 is received.  But this is open to the driver implementation and every driver
 must also handle parameter changes which are not encapsulated by
-.B LIRC_SETUP_START
+.BR LIRC_SETUP_START
 and
-.B LIRC_SETUP_END.
+.BR LIRC_SETUP_END.
 Drivers can also choose to ignore these ioctls.
 
 .TP
-.B LIRC_NOTIFY_DECODE " (\fIvoid\fP)"
+.BR LIRC_NOTIFY_DECODE " (\fIvoid\fP)"
 This ioctl is called by lircd whenever a successful decoding of an
-incoming IR signal could be done. This can be used by supporting hardware
-to give visual user feedback e.g.,  by flashing a LED.
+incoming IR signal could be done.
+This can be used by supporting hardware to give visual user feedback,
+for example by flashing a LED.
 
 .SH FEATURES
 .P
 The features returned by
-.B LIRC_GET_FEATURES
-is a bitmask combining the following bits.
+.BR LIRC_GET_FEATURES
+is a bitmask combining the following bits:
 .TP 8
-.B LIRC_CAN_REC_RAW
-The driver is capable of receiving using LIRC_MODE_RAW
+.BR LIRC_CAN_REC_RAW
+The driver is capable of receiving using
+.BR LIRC_MODE_RAW
 .TP 8
 .B LIRC_CAN_REC_PULSE
-The driver is capable of receiving using LIRC_MODE_PULSE
+The driver is capable of receiving using
+.BR LIRC_MODE_PULSE
 .TP 8
-.B LIRC_CAN_REC_MODE2
-The driver is capable of receiving using LIRC_MODE_MODE2
+.BR LIRC_CAN_REC_MODE2
+The driver is capable of receiving using
+.BR LIRC_MODE_MODE2
 .TP 8
 .B LIRC_CAN_REC_LIRCCODE
-The driver is capable of receiving using LIRC_MODE_LIRCCODE
+The driver is capable of receiving using
+.BR LIRC_MODE_LIRCCODE
 .TP 8
-.B LIRC_CAN_SET_SEND_CARRIER
+.BR LIRC_CAN_SET_SEND_CARRIER
 Driver supports  changing the modulation frequency using
-.B LIRC_SET_SEND_CARRIER.
+.BR LIRC_SET_SEND_CARRIER.
 .TP 8
-.B LIRC_CAN_SET_SEND_DUTY_CYCLE
-Driver supports changing the duty cycle using LIRC_SET_SEND_DUTY_CYCLE.
+.BR LIRC_CAN_SET_SEND_DUTY_CYCLE
+Driver supports changing the duty cycle using
+.BR LIRC_SET_SEND_DUTY_CYCLE.
 .TP 8
-.B LIRC_CAN_SET_TRANSMITTER_MASK
+.BR LIRC_CAN_SET_TRANSMITTER_MASK
 Enables the given set of transmitters.
 The first transmitter is encoded by the least significant bit, etc.
-When an invalid bit mask is given e. g.,  a bit is set even though the
+When an invalid bit mask is given, for example a bit is set even though the
 device does not have so many transmitters, returns the number of available
-transitters and does nothing otherwise.
+transmitters and does nothing otherwise.
 .TP 8
-.B LIRC_CAN_SET_REC_CARRIER
-Drvier supports setting the receive carrier frequency using
-.B LIRC_SET_REC_CARRIER.
+.BR LIRC_CAN_SET_REC_CARRIER
+Driver supports setting the receive carrier frequency using
+.BR LIRC_SET_REC_CARRIER.
 .TP 8
-.B LIRC_CAN_SET_REC_DUTY_CYCLE_RANGE
-Driver supports LIRC_SET_REC_DUTY_CYCLE_RANGE
+.BR LIRC_CAN_SET_REC_DUTY_CYCLE_RANGE
+Driver supports
+.BR LIRC_SET_REC_DUTY_CYCLE_RANGE
 .TP 8
-.B LIRC_CAN_SET_REC_CARRIER_RANGE
-Driver supports LIRC_SET_REC_CARRIER_RANGE
+.BR LIRC_CAN_SET_REC_CARRIER_RANGE
+Driver supports
+.BR LIRC_SET_REC_CARRIER_RANGE
 .TP 8
-.B LIRC_CAN_GET_REC_RESOLUTION
-Driver supports LIRC_GET_REC_RESOLUTION
+.BR LIRC_CAN_GET_REC_RESOLUTION
+Driver supports
+.BR LIRC_GET_REC_RESOLUTION
 .TP 8
-.B LIRC_CAN_SET_REC_TIMEOUT
-Driver supports LIRC_SET_REC_TIMEOUT
+.BR LIRC_CAN_SET_REC_TIMEOUT
+Driver supports
+.BR LIRC_SET_REC_TIMEOUT
 .TP 8
-.B LIRC_CAN_SET_REC_FILTER
-Driver supports LIRC_SET_REC_FILTER
+.BR LIRC_CAN_SET_REC_FILTER
+Driver supports
+.BR LIRC_SET_REC_FILTER
 .TP 8
-.B LIRC_CAN_MEASURE_CARRIER
+.BR LIRC_CAN_MEASURE_CARRIER
 Driver supports measuring of the modulation frequency using
-.B LIRC_MEASURE_CARRIER
+.BR LIRC_MEASURE_CARRIER
 .TP 8
-.B LIRC_CAN_USE_WIDEBAND_RECEIVER
+.BR LIRC_CAN_USE_WIDEBAND_RECEIVER
 Driver supports learning mode using
-.B LIRC_SET_WIDEBAND_RECEIVER
+.BR LIRC_SET_WIDEBAND_RECEIVER
 .TP 8
-.B LIRC_CAN_NOTIFY_DECODE
-Driver supports LIRC_NOTIFY_DECODE.
+.BR LIRC_CAN_NOTIFY_DECODE
+Driver supports
+.BR LIRC_NOTIFY_DECODE.
 .TP 8
-.B LIRC_CAN_SEND_RAW
+.BR LIRC_CAN_SEND_RAW
 Driver supports sending using
-.B LIRC_SEND_RAW
+.BR LIRC_SEND_RAW
 .TP 8
-.B LIRC_CAN_SEND_PULSE
+.BR LIRC_CAN_SEND_PULSE
 Driver supports sending using
-.B LIRC_MODE_PULSE
+.BR LIRC_MODE_PULSE
 .TP 8
-.B LIRC_CAN_SEND_MODE2
+.BR LIRC_CAN_SEND_MODE2
 Driver supports sending using
-.B LIRC_SEND_MODE2
+.BR LIRC_SEND_MODE2
 .TP 8
-.B LIRC_CAN_SEND_LIRCCODE
+.BR LIRC_CAN_SEND_LIRCCODE
 Driver supports sending
-.B LIRC_SEND_LIRCCODE
+.BR LIRC_SEND_LIRCCODE
 (this is uncommon, since
-.B LIRCCODE
-drivers reflects hardware like TV-cards which usually does not support
+.BR LIRCCODE
+drivers reflect hardware like TV-cards which usually does not support
 sending.)
 
 .SH BUGS
 .P
-Using these devices requires the kernel source header file lirc.h. That this
-file is not public is a bug, see
-https://bugzilla.kernel.org/show_bug.cgi?id=75751. For the time being the
-file is bundled in the lirc package, see http://www.lirc.org.
+Using these devices requires the kernel source header file lirc.h.
+That this file is not public is a bug, see
+https://bugzilla.kernel.org/show_bug.cgi?id=75751.
+For the time being the file is bundled in the lirc package,
+see http://www.lirc.org.
 .P
 This manual page should really be part of the upstream man-pages project.
 
-- 
2.4.3


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
