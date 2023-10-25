import { TextInput } from "react-native-gesture-handler";

type TProfileInputProps = TextInput['props'] & {

}
export function ProfileInput({ ...props }: TProfileInputProps) {
    return (
        <TextInput
            style={{
                fontSize: 12,
                paddingHorizontal: 4,
                borderRadius: 4,
                borderWidth: 1,
                borderColor: '#00000088',
            }}
            {...props}
        />
    )
}