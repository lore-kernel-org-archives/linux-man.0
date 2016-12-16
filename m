From: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: RFC: capabilities(7): notes for kernel developers
Date: Thu, 15 Dec 2016 16:44:30 -0800
Message-ID: <7a6b5f38-de8e-d8d4-e6f7-feae3f8d192e@schaufler-ca.com>
References: <cdbc35f2-925e-aa65-98e7-a4ae4a5ded2c@gmail.com>
 <edb66332-86c9-6122-85c5-f856309cbfc1@schaufler-ca.com>
 <43dcc6dc-265b-5eaf-3a70-701e05200b9f@gmail.com>
 <9ed6371f-3d38-45b1-a85b-1fbb3e5b4fc7@schaufler-ca.com>
 <CALAqxLWr8+GpGG+geibKQqPxGHtPQbzYjEptjA4r+jNcRrMWvw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <CALAqxLWr8+GpGG+geibKQqPxGHtPQbzYjEptjA4r+jNcRrMWvw@mail.gmail.com>
Sender: owner-linux-security-module@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>, James Morris <jmorris@namei.org>, Kees Cook <keescook@chromium.org>, Andy Lutomirski <luto@amacapital.net>, Jann Horn <jann@thejh.net>, "Eric W. Biederman" <ebiederm@xmission.com>, linux-man <linux-man@vger.kernel.org>, linux-security-module <linux-security-module@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

On 12/15/2016 4:31 PM, John Stultz wrote:
> On Thu, Dec 15, 2016 at 12:40 PM, Casey Schaufler
> <casey@schaufler-ca.com> wrote:
>> On 12/15/2016 11:41 AM, Michael Kerrisk (man-pages) wrote:
>>> On 12/15/2016 05:29 PM, Casey Schaufler wrote:
>>>> CAP_WAKE_ALARM could readily be CAP_TIME.
>>> Actually, I don't quite understand what you mean with that sentence.
>>> Could you elaborate?
>> Should have said CAP_SYS_TIME
>>
>> Setting an alarm could be considered a time management function,
>> depending on what it actually does.
> Just a nit here. CAP_WAKE_ALARM is more about the privilege of waking
> a system from suspend, while CAP_SYS_TIME covers the ability to set
> the time. One wouldn't necessarily want to give applications which
> could wake a system up the capability to also set the time.

Doesn't really matter, except that an ignorant developer
might make the mistake I did and assume that WAKE_ALARM
was somehow related to time management. If you want to use
it as an example don't let my dunderheadedness get in your
way.

> thanks
> -john

Again, thank you for taking this on. It should be a
big help.

