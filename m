From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: RFC: capabilities(7): notes for kernel developers
Date: Sat, 17 Dec 2016 22:01:02 +0100
Message-ID: <44e41891-8127-b5b4-96cb-d95684e85ac3@gmail.com>
References: <cdbc35f2-925e-aa65-98e7-a4ae4a5ded2c@gmail.com>
 <edb66332-86c9-6122-85c5-f856309cbfc1@schaufler-ca.com>
 <43dcc6dc-265b-5eaf-3a70-701e05200b9f@gmail.com>
 <9ed6371f-3d38-45b1-a85b-1fbb3e5b4fc7@schaufler-ca.com>
 <CALAqxLWr8+GpGG+geibKQqPxGHtPQbzYjEptjA4r+jNcRrMWvw@mail.gmail.com>
 <7a6b5f38-de8e-d8d4-e6f7-feae3f8d192e@schaufler-ca.com>
 <e8a6d266-9870-2591-576b-927208683b5d@gmail.com>
 <20161216201026.GB14856@mail.hallyn.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <20161216201026.GB14856@mail.hallyn.com>
Sender: owner-linux-security-module@vger.kernel.org
To: "Serge E. Hallyn" <serge@hallyn.com>
Cc: mtk.manpages@gmail.com, Casey Schaufler <casey@schaufler-ca.com>, John Stultz <john.stultz@linaro.org>, James Morris <jmorris@namei.org>, Kees Cook <keescook@chromium.org>, Andy Lutomirski <luto@amacapital.net>, Jann Horn <jann@thejh.net>, "Eric W. Biederman" <ebiederm@xmission.com>, linux-man <linux-man@vger.kernel.org>, linux-security-module <linux-security-module@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

On 12/16/2016 09:10 PM, Serge E. Hallyn wrote:
> Quoting Michael Kerrisk (man-pages) (mtk.manpages@gmail.com):
>> On 12/16/2016 01:44 AM, Casey Schaufler wrote:
>>> On 12/15/2016 4:31 PM, John Stultz wrote:
>>>> On Thu, Dec 15, 2016 at 12:40 PM, Casey Schaufler
>>>> <casey@schaufler-ca.com> wrote:
>>>>> On 12/15/2016 11:41 AM, Michael Kerrisk (man-pages) wrote:
>>>>>> On 12/15/2016 05:29 PM, Casey Schaufler wrote:
>>>>>>> CAP_WAKE_ALARM could readily be CAP_TIME.
>>>>>> Actually, I don't quite understand what you mean with that sentence.
>>>>>> Could you elaborate?
>>>>> Should have said CAP_SYS_TIME
>>>>>
>>>>> Setting an alarm could be considered a time management function,
>>>>> depending on what it actually does.
>>>> Just a nit here. CAP_WAKE_ALARM is more about the privilege of waking
>>>> a system from suspend, while CAP_SYS_TIME covers the ability to set
>>>> the time. One wouldn't necessarily want to give applications which
>>>> could wake a system up the capability to also set the time.
>>>
>>> Doesn't really matter, except that an ignorant developer
>>> might make the mistake I did and assume that WAKE_ALARM
>>> was somehow related to time management. If you want to use
>>> it as an example don't let my dunderheadedness get in your
>>> way.
>>
>> Actually, I decided it wasn't such a good example anyway.
>> That capability could potentially be generic. (But it probably
>> should better have been named something like 'CAP_WAKE_SYSTEM'.)
> 
> How about:
> 
> Subject: [PATCH 1/1] capabilities: alias CAP_WAKE_SYSTEM to CAP_WAKE_ALARM
> 
> As suggested by Michael Kerrisk his is a less confusing name, and
> this won't break any old userspace.

Yes, but. The names are used in user-space: should cap_to_text() or
cap_from_text() be reworked to understand these new names? For the former,
it seems like a bad idea, and for the latter it's dubious I would say.
So, I'm concerned that renaming/adding a synonym at the API level 
creates some inconsistency with user-space. Maybe I worry too much?

What certainly would be good is to more clearly document the (broader)
purpose of the (misnamed) capability in capabilities(7). Something along
the lines of John's suggestion.

Cheers,

Michael

> Signed-off-by: Serge Hallyn <serge@hallyn.com>
> Cc: Michael Kerrisk <mtk.manpages@gmail.com>
> ---
>  include/uapi/linux/capability.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/uapi/linux/capability.h b/include/uapi/linux/capability.h
> index fd4f87d..ba972ff 100644
> --- a/include/uapi/linux/capability.h
> +++ b/include/uapi/linux/capability.h
> @@ -357,6 +357,8 @@ struct vfs_ns_cap_data {
>  
>  #define CAP_WAKE_ALARM            35
>  
> +#define CAP_WAKE_SYSTEM      CAP_WAKE_ALARM
> +
>  /* Allow preventing system suspends */
>  
>  #define CAP_BLOCK_SUSPEND    36
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
