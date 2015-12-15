From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: New manpage lirc.4 (Was: Possibly new manpages: lirc and lirc_ioctl)
Date: Tue, 15 Dec 2015 12:51:05 +0100
Message-ID: <566FFEA9.6040300@gmail.com>
References: <548EE482.4020700@gmail.com>	<54998ACB.2070500@gmail.com>	<554789CA.2070302@gmail.com>	<5547A19B.9080503@gmail.com>	<5547B8F1.2000305@gmail.com>	<5547CD95.2070208@gmail.com>	<5663FD8C.9030204@gmail.com>	<CAKgNAkj3C2ApPhBfUiQVtptquS5b5Cfti+gdpqbXbOR2tCWBFg@mail.gmail.com>	<5664AAA5.6040203@gmail.com>	<566B20F0.1020808@gmail.com>	<20151212073418.088593cb@snorken.kolmodin.net>	<CAKgNAkjaTX5N89ZHPJGBeAcj-cznp-gfGeCM-FfLky1=GC3znA@mail.gmail.com>	<566DBA29.3090605@gmx.com>	<566E9120.2060806@gmail.com>	<566EF2F5.5020608@gmail.com>	<20151214194851.01dca2ed@snorken.kolmodin.net>	<566F2924.8050002@gmail.com> <20151214214957.65d18401@snorken.kolmodin.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151214214957.65d18401-+x4wjRbgnhz3VejZBQxdeuTW4wlIGRCZ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alec Leamas <leamas.alec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Alec,

On 12/14/2015 09:49 PM, Alec Leamas wrote:
> On Mon, 14 Dec 2015 21:40:04 +0100
> "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
>> Hi Alec,
>>
>>> Revised patch below. In case of troubles, a fresh copy is available at 
>>> http://paste.fedoraproject.org/300732/45011842
>>
>> The version inline, and at that URL seems to be an old version of the page where
>> the fixes just discussed have not been made....
> 
> Sigh... What's happening, really? Making a new try: correct mailer, the right patch?!
> 
> http://paste.fedoraproject.org/300790/25945145

Yes, we're good this time. I've applied your patch in a public branch
(http://git.kernel.org/cgit/docs/man-pages/man-pages.git/log/?h=draft_lirc )
and done a few light edits.

I haven't yet merged this into 'master' because the corresponding
kernel patch is not yet in mainline (right)?

Thanks for all of your effort pulling this page together!

Cheers,

Michael

> From 5c3191b29a81e202ecc59e967cb2c508ece3e855 Mon Sep 17 00:00:00 2001
> From: Alec Leamas <leamas.alec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Date: Mon, 14 Dec 2015 21:44:39 +0100
> Subject: [PATCH] Adding new lirc.4 manpage.
> 
> ---
>  doc/man-source/lirc.4 | 446 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 446 insertions(+)
>  create mode 100644 doc/man-source/lirc.4
> 
> diff --git a/doc/man-source/lirc.4 b/doc/man-source/lirc.4
> new file mode 100644
> index 0000000..4b72463
> --- /dev/null
> +++ b/doc/man-source/lirc.4
> @@ -0,0 +1,446 @@
> +.TH LIRC 4 "Aug 2015" "Linux" "Linux Programmer's Manual"
> +
> +
> +.\" Copyright (c) 2015, Alec Leamas
> +.\"
> +.\" %%%LICENSE_START(GPLv2+_DOC_FULL)
> +.\" This is free documentation; you can redistribute it and/or
> +.\" modify it under the terms of the GNU General Public License as
> +.\" published by the Free Software Foundation; either version 2 of
> +.\" the License, or (at your option) any later version.
> +.\"
> +.\" The GNU General Public License's references to "object code"
> +.\" and "executables" are to be interpreted as the output of any
> +.\" document formatting or typesetting system, including
> +.\" intermediate and printed output.
> +.\"
> +.\" This manual is distributed in the hope that it will be useful,
> +.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
> +.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> +.\" GNU General Public License for more details.
> +.\"
> +.\" You should have received a copy of the GNU General Public
> +.\" License along with this manual; if not, see
> +.\" <http://www.gnu.org/licenses/>.
> +.\" %%%LICENSE_END
> +.SH NAME
> +lirc \- lirc devices
> +.SH DESCRIPTION
> +.P
> +\fB/dev/lirc*\fR are character devices providing a low-level
> +bi-directional interface to infra-red (IR) remotes.
> +When receiving data, the driver works in two different modes depending
> +on the underlying hardware.
> +.P
> +Some hardware (typically TV-cards) decodes the IR signal internally
> +and just provides decoded button presses as integer values.
> +Drivers for this kind of hardware work in
> +.BR LIRC_MODE_LIRCCODE .
> +Such hardware usually does not support sending IR signals.
> +Furthermore, it usually only works with a specific remote which is
> +bundled with, for example, a TV-card.
> +.P
> +Other hardware provides a stream of pulse/space durations.
> +Such drivers work in
> +.BR LIRC_MODE_MODE2 .
> +Sometimes, this kind of hardware also supports
> +sending IR data.
> +Such hardware can be used with (almost) any kind of remote.
> +.P
> +The \fBLIRC_GET_REC_MODE\fR ioctl (see below) allows probing for the
> +mode.
> +
> +.SS Reading input with the LIRC_MODE_MODE2 drivers
> +.P
> +In the \fBLIRC_MODE_MODE2 mode\fR, the data returned by
> +.BR read (2)
> +provides 32-bit values representing a space or a pulse duration, by
> +convention typed as
> +.IR lirc_t .
> +The time of the duration (microseonds) is encoded in the lower 24 bits.
> +The upper 8 bit reflects the type of package:
> +.TP 4
> +.BR LIRC_MODE2_SPACE .
> +Value reflects a space duration (microseconds).
> +.TP 4
> +.BR LIRC_MODE2_PULSE .
> +Value reflects a pulse duration (microseconds).
> +.TP 4
> +.BR LIRC_MODE2_FREQUENCY .
> +Value reflects a frequency (hz), see the
> +.B LIRC_SET_MEASURE_CARRIER
> +ioctl.
> +.TP 4
> +.BR LIRC_MODE2_TIMEOUT .
> +The package reflects a timeout, see the
> +.B LIRC_SET_REC_TIMEOUT_REPORTS
> +ioctl.
> +
> +.SS Reading input with the
> +.B LIRC_MODE_LIRCCODE
> +drivers
> +.P
> +In the \fBLIRC_MODE_LIRCCODE\fR
> +mode, the data returned by
> +.BR read2()
> +reflects decoded button presses.
> +The length of each packet can be retrieved using
> +the \fBLIRC_GET_LENGTH\fR ioctl.
> +Reads must be done in blocks matching
> +the bit count returned by the \fBLIRC_GET_LENGTH\fR ioctl, rounded
> +up so it matches full bytes.
> +
> +.SS Sending data
> +.P
> +When sending data, only the \fBLIRC_MODE_PULSE\fR
> +mode is supported.
> +The data written to the character device using
> +.BR write(2)
> +is a pulse/space sequence of integer values.
> +Pulses and spaces are only marked implicitly by their position.
> +The data must start and end with a pulse, thus it must always include
> +an odd number of samples.
> +The
> +.BR write(2)
> +function blocks until the data has been transmitted by the
> +hardware.
> +If more data is provided than the hardware can send, the
> +.BR write(2)
> +call fails with the error
> +.BR EINVAL
> +
> +.SH SUPPORTED IOCTL COMMANDS
> +.P
> +.nf
> +#include " (\fIlirc/include/media/lirc.h\fP) " /* But see BUGS */
> +int ioctl(int fd, int cmd, ...);
> +.fi
> +.P
> +The following ioctls can be used to probe or change specific lirc
> +hardware settings.
> +Many require a third argument, usually an
> +.IR int .
> +referred to below as
> +.I val .
> +.P
> +In general, each driver should have a default set of settings.
> +The driver implementation is expected to re-apply the default settings
> +when the device is closed by userspace, so that every application
> +opening the device can rely on working with the default settings
> +initially.
> +
> +.BR
> +.SS Always Supported Commands
> +.P
> +\fI/dev/lirc*\fR devices always support the following commands:
> +.TP 4
> +.BR LIRC_GET_FEATURES " (\fIvoid\fP)"
> +Returns a bitmask of combined features bits, see FEATURES.
> +Some drivers have dynamic features which are not updated until after
> +an init() command.
> +.TP
> +.BR LIRC_GET_REC_MODE ,
> +Returns the receive mode, which will be one of:
> +.RS 4
> +.TP
> +.BR LIRC_MODE_MODE2 " (\fIvoid\fP)"
> +Driver returns a sequence of pulse/space durations.
> +.TP
> +.BR LIRC_MODE_LIRCCODE
> +Driver returns integer values, each of which represents a decoded
> +button press.
> +.RE
> +.P
> +If a device returns an error code for
> +.BR LIRC_GET_REC_MODE
> +it is safe to assume it is not a lirc device.
> +
> +.SS Optional Commands
> +.P
> +Some lirc devices support commands listed below.
> +Unless otherwise stated, these fail with the error \fBENOIOCTLCMD\fR
> +or with the error \fBENOSYS\fR if the operation
> +isn't supported, or with the error \fBEINVAL\fR if the operation
> +failed.
> +.TP
> +.BR LIRC_SET_REC_MODE " (\fIint\fP)"
> +Set the receive mode.
> +.IR val
> +is either
> +.BR LIRC_MODE_LIRCCODE
> +or
> +.BR LIRC_MODE_MODE2 .
> +
> +.TP
> +.BR LIRC_GET_LENGTH " (\fIvoid\fP)"
> +Return the length of the returned codes for
> +.BR LIRC_LIRCCODE
> +type
> +drivers, otherwise fail with the error
> +.BR ENOIOCTLCMD .
> +.TP
> +.BR LIRC_GET_SEND_MODE " (\fIvoid\fP)"
> +Returns the send mode; currently only
> +.BR LIRC_MODE_PULSE
> +is supported.
> +.TP
> +.BR LIRC_SET_SEND_MODE " (\fIint\fP)"
> +Set the send mode.
> +Currently serves no purpose since only
> +.BR LIRC_MODE_PULSE
> +is supported.
> +.TP
> +.BR LIRC_SET_SEND_CARRIER " (\fIint\fP)"
> +Set the modulation frequency. The argument is the frequency (Hz).
> +.TP
> +.BR SET_SEND_DUTY_CYCLE " (\fIint\fP)"
> +Set the carrier duty cycle.
> +The argument is an int (0 < value < 100) which
> +describes the pulse width in percent of the total cycle.
> +Currently, no special meaning is defined for 0 or 100, but the values
> +are reserved for future use.
> +.TP
> +.BR LIRC_GET_MIN_TIMEOUT " (\fIvoid\fP)", " "\
> +LIRC_GET_MAX_TIMEOUT " (\fIvoid\fP)"
> +Some devices have internal timers that can be used to detect when
> +there's no IR activity for a long time.
> +This can help
> +.BR lircd(8)
> +in detecting that an IR signal is finished and can speed up the
> +decoding process.
> +Returns an integer value with the minimum/maximum timeout that can be
> +set (microseconds).
> +Some devices have a fixed timeout. For such drivers,
> +.BR LIRC_GET_MIN_TIMEOUT
> +and
> +.BR LIRC_GET_MAX_TIMEOUT
> +will return the same value.
> +.TP
> +.BR LIRC_SET_REC_TIMEOUT " (\fIint\fP)"
> +Sets the integer value for IR inactivity timeout (microseconds).
> +To be accepted, the value must be within the limits defined by
> +.BR LIRC_GET_MIN_TIMEOUT
> +and
> +.BR LIRC_GET_MAX_TIMEOUT .
> +A value of 0 (if supported by the hardware) disables all hardware
> +timeouts and data should be reported as soon as possible.
> +If the exact value cannot be set, then the next possible value
> +.I greater
> +than the given value should be set.
> +.TP
> +.BR LIRC_SET_REC_TIMEOUT_REPORTS " (\fIint\fP)"
> +Enables
> +.RI ( val
> +is 1) or disables
> +.RI (val
> +is 0) timeout packages in
> +.BR LIRC_MODE_MODE2 .
> +By default, timeout reports should be turned off.
> +.TP
> +.BR LIRC_SET_REC_CARRIER " (\fIint\fP)"
> +Set the receive carrier frequency (Hz).
> +.TP
> +After opening device, the first use of
> +.BR LIRC_SET_REC_CARRIER_RANGE " (\fIint\fP)"
> +sets the lower bound of the carrier range, second time the upper
> +bound (Hz).
> +.TP
> +.BR LIRC_SET_MEASURE_CARRIER " (\fIint\fP)"
> +Enables
> +.RI ( val
> +is 1) or disables
> +.RI (val
> +is 0) the measure mode
> +If enabled, from the next key press on, the driver will send
> +.BR LIRC_MODE2_FREQUENCY
> +packets. By default this should be turned off.
> +.TP
> +.BR LIRC_GET_REC_RESOLUTION " (\fIvoid\fP)"
> +Returns the driver resolution (microseconds).
> +.TP
> +.BR LIRC_GET_MIN_FILTER_PULSE " (\fIvoid\fP)", " " \
> +LIRC_GET_MAX_FILTER_PULSE " (\fIvoid\fP)"
> +Some devices are able to filter out spikes in the incoming signal
> +using given filter rules.
> +These ioctls return the hardware capabilities that describe the bounds
> +of the possible filters.
> +Filter settings depend on the IR protocols that are expected.
> +lircd derives the settings from all protocols definitions found in its
> +.BR lircd.conf (5)
> +config file.
> +.TP
> +.BR LIRC_GET_MIN_FILTER_SPACE " (\fIvoid\fP)", " " \
> +LIRC_GET_MAX_FILTER_SPACE " (\fIvoid\fP)"
> +See
> +.BR LIRC_GET_MIN_FILTER_PULSE .
> +.TP
> +.BR LIRC_SET_REC_FILTER " (\fIint\fP)"
> +Pulses/spaces shorter than this (microseconds) are filtered out by
> +hardware.
> +.TP
> +.BR LIRC_SET_REC_FILTER_PULSE " (\fIint\fP)", " " \
> +LIRC_SET_REC_FILTER_SPACE " (\fIint\fP)"
> +Pulses/spaces shorter than this (microseconds) are filtered out by
> +hardware.
> +If filters cannot be set independently for pulse/space, the
> +corresponding ioctls must return an error and
> +.BR LIRC_SET_REC_FILTER
> +should be used instead.
> +.TP
> +.BR LIRC_SET_TRANSMITTER_MASK
> +Enables the given set of transmitters.
> +.RI val
> +contains a bitmask where each enabled transmitter is a 1.
> +The first transmitter is encoded by the least significant bit, etc.
> +When an invalid bit mask is given, for example a bit is set even
> +though the device does not have so many transmitters, returns the
> +number of available transmitters and does nothing otherwise.
> +.TP
> +.BR LIRC_SET_WIDEBAND_RECEIVER " (\fIint\fP)"
> +Some devices are equipped with a special wide band receiver which are
> +intended to be used to learn the output of an existing remote.
> +This ioctl can be used to enable
> +.RI ( val
> +equals 1) or disable
> +.RI ( val
> +equals 0) this functionality.
> +This might be useful for devices that otherwise have narrow band
> +receivers that prevent them to be used with certain remotes.
> +Wide band receivers may also be more precise.
> +On the other hand its disadvantage usually is reduced range of
> +reception.
> +.IP
> +Note: wide band receiver may be implicitly enabled if you enable
> +carrier reports.
> +In that case it will be disabled as soon as you disable carrier reports.
> +Trying to disable a wide band receiver while carrier reports are active
> +will do nothing.
> +
> +.TP
> +.BR LIRC_SETUP_START " (\fIvoid\fP)", " "LIRC_SETUP_END " (\fIvoid\fP)"
> +Setting of several driver parameters can be optimized by encapsulating
> +the actual ioctl calls with
> +.BR LIRC_SETUP_START/LIRC_SETUP_END .
> +When a driver receives a
> +.BR LIRC_SETUP_START
> +ioctl it can choose to not commit further setting changes to the
> +hardware until a
> +.BR LIRC_SETUP_END
> +is received.
> +But this is open to the driver implementation and every driver
> +must also handle parameter changes which are not encapsulated by
> +.BR LIRC_SETUP_START
> +and
> +.BR LIRC_SETUP_END .
> +Drivers can also choose to ignore these ioctls.
> +
> +.TP
> +.BR LIRC_NOTIFY_DECODE " (\fIvoid\fP)"
> +This ioctl is called by
> +.BR lircd(8)
> +whenever a successful decoding of an incoming IR signal is possible.
> +This can be used by supporting hardware to give visual user
> +feedback, for example by flashing an LED.
> +
> +.SH FEATURES
> +.P
> +The features returned by
> +.BR LIRC_GET_FEATURES
> +is a bitmask combining the following bits:
> +.TP 8
> +.BR LIRC_CAN_REC_RAW
> +The driver is capable of receiving using
> +.BR LIRC_MODE_RAW .
> +.TP 8
> +.BR LIRC_CAN_REC_PULSE
> +The driver is capable of receiving using
> +.BR LIRC_MODE_PULSE .
> +.TP 8
> +.BR LIRC_CAN_REC_MODE2
> +The driver is capable of receiving using
> +.BR LIRC_MODE_MODE2 .
> +.TP 8
> +.BR LIRC_CAN_REC_LIRCCODE
> +The driver is capable of receiving using
> +.BR LIRC_MODE_LIRCCODE .
> +.TP 8
> +.BR LIRC_CAN_SET_SEND_CARRIER
> +Driver supports changing the modulation frequency using
> +.BR LIRC_SET_SEND_CARRIER .
> +.TP 8
> +.BR LIRC_CAN_SET_SEND_DUTY_CYCLE
> +Driver supports changing the duty cycle using
> +.BR LIRC_SET_SEND_DUTY_CYCLE .
> +.TP 8
> +.BR LIRC_CAN_SET_TRANSMITTER_MASK
> +Driver supports changing the active transmitter(s) using
> +.BR LIRC_SET_TRANSMITTER_MASK .
> +.TP 8
> +.BR LIRC_CAN_SET_REC_CARRIER
> +Driver supports setting the receive carrier frequency using
> +.BR LIRC_SET_REC_CARRIER .
> +.TP 8
> +.BR LIRC_CAN_SET_REC_DUTY_CYCLE_RANGE
> +Driver supports
> +.BR LIRC_SET_REC_DUTY_CYCLE_RANGE .
> +.TP 8
> +.BR LIRC_CAN_SET_REC_CARRIER_RANGE
> +Driver supports
> +.BR LIRC_SET_REC_CARRIER_RANGE .
> +.TP 8
> +.BR LIRC_CAN_GET_REC_RESOLUTION
> +Driver supports
> +.BR LIRC_GET_REC_RESOLUTION .
> +.TP 8
> +.BR LIRC_CAN_SET_REC_TIMEOUT
> +Driver supports
> +.BR LIRC_SET_REC_TIMEOUT .
> +.TP 8
> +.BR LIRC_CAN_SET_REC_FILTER
> +Driver supports
> +.BR LIRC_SET_REC_FILTER .
> +.TP 8
> +.BR LIRC_CAN_MEASURE_CARRIER
> +Driver supports measuring of the modulation frequency using
> +.BR LIRC_MEASURE_CARRIER .
> +.TP 8
> +.BR LIRC_CAN_USE_WIDEBAND_RECEIVER
> +Driver supports learning mode using
> +.BR LIRC_SET_WIDEBAND_RECEIVER .
> +.TP 8
> +.BR LIRC_CAN_NOTIFY_DECODE
> +Driver supports
> +.BR LIRC_NOTIFY_DECODE .
> +.TP 8
> +.BR LIRC_CAN_SEND_RAW
> +Driver supports sending using
> +.BR LIRC_SEND_RAW .
> +.TP 8
> +.BR LIRC_CAN_SEND_PULSE
> +Driver supports sending using
> +.BR LIRC_MODE_PULSE .
> +.TP 8
> +.BR LIRC_CAN_SEND_MODE2
> +Driver supports sending using
> +.BR LIRC_SEND_MODE2 .
> +.TP 8
> +.BR LIRC_CAN_SEND_LIRCCODE
> +Driver supports sending.
> +.BR LIRC_SEND_LIRCCODE
> +(this is uncommon, since
> +.BR LIRCCODE
> +drivers reflect hardware like TV-cards which usually does not support
> +sending.)
> +
> +.SH BUGS
> +.P
> +Using these devices requires the kernel source header file lirc.h.
> +This file not being public is a bug, see
> +https://bugzilla.kernel.org/show_bug.cgi?id=75751.
> +For the time being the file is bundled in the lirc package,
> +see http://www.lirc.org.
> +
> +
> +.SH SEE ALSO
> +.P
> +https://www.kernel.org/doc/htmldocs/media_api/lirc_dev.html
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
