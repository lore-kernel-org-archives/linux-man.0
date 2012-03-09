From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 2/2] Add kcmp.2 manpage
Date: Fri, 09 Mar 2012 13:15:21 -0800
Message-ID: <4F5A72E9.5030802@zytor.com>
References: <1331326042-32558-1-git-send-email-gorcunov@openvz.org> <1331326042-32558-3-git-send-email-gorcunov@openvz.org> <4F5A6D09.3050704@zytor.com> <20120309210342.GN13346@moon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120309210342.GN13346@moon>
Sender: linux-kernel-owner@vger.kernel.org
To: Cyrill Gorcunov <gorcunov@openvz.org>
Cc: mtk.manpages@gmail.com, akpm@linux-foundation.org, xemul@parallels.com, linux-man@vger.kernel.org, linux-kernel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>
List-Id: linux-man@vger.kernel.org

On 03/09/2012 01:03 PM, Cyrill Gorcunov wrote:
> On Fri, Mar 09, 2012 at 12:50:17PM -0800, H. Peter Anvin wrote:
>> On 03/09/2012 12:47 PM, Cyrill Gorcunov wrote:
>>> +.I v2
>>> +, but ordering information is unavailble.
>>
>> Needs to be:
>>
>> .IR v2 ,
>>
>> ... and fix the typo in "unavailable".
>>
> 
> here we go
> 
> 	Cyrill

No, you missed the point, which is that the comma moved to the .IR line.

.BR and .IR mean "alternate between bold/italic and regular", so

.IR foo bar

gives you "foobar" where only "foo" is italiziced.  It is equivalent to:

\fIfoo\fPbar

	-hpa


-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.
